module Warehouse
  class Fact < ActiveRecord::Base
    self.abstract_class = true

    def self.dimension(dimension_key, options = {})
      raise NotImplementedError unless options[:degenerate] == true
      validates dimension_key, presence: true
    end

    def self.update
      etl({ dirty: true })
      complete
    end

    def self.rebuild(options = {})
      where(options).delete_all
      etl({ dirty: false }.update(options))
      complete
    end

    protected

    def self.transform(row)
      row
    end

    def self.complete
    end

    def self.etl(options)
      extract(options) { |row| load(*transform(row)) }
    end
  end
end




module Warehouse
  class HourlyMeasurementFact < Warehouse::Fact

    dimension :start_at, degenerate: true
    dimension :source, degenerate: true
    dimension :user_id, degenerate: true
    dimension :metric_id, degenerate: true
    dimension :measurement_type_id, degenerate: true

    def self.extract(options = {}, &blk)
      selects = ['SUM(value) sum_value', 'AVG(value) avg_value',
        'COUNT(value) count_value', 'MIN(value) min_value',
        'MAX(value) max_value', 'entries.user_id', 'entries.metric_id',
        'entries.source', 'measurements.measurement_type_id',
        "DATE_TRUNC('hour', measured_on) AS start_at"]

      group_sql = 'start_at, measurements.measurement_type_id, entries.source, entries.user_id, entries.metric_id'

      relation = Entry.select(selects.join(', ')).joins(:measurements).group(group_sql)
      relation = relation.where(user_id: options[:user_id]) if options[:user_id]

      options[:dirty] ? extract_dirty(relation, blk) : extract_all(relation, blk)
    end

    def self.transform(row)
      constraints = { user_id: row['user_id'],
        metric_id: row['metric_id'], source: row['source'],
        measurement_type_id: row['measurement_type_id'],
        start_at: row['start_at'] }

      values = { sum: BigDecimal.new(row['sum_value']),
        average: BigDecimal.new(row['avg_value']),
        min: BigDecimal.new(row['min_value']),
        max: BigDecimal.new(row['max_value']),
        count: row['count_value'].to_i }

      [constraints, values]
    end

    def self.load(constraints, values)
      # upsert(constraints, values)
      row = send("find_or_initialize_by_#{constraints.keys.join('_and_')}", *constraints.values)
      row.assign_attributes(values, without_protection: true)
      row.save!
    end

    def self.complete
      DirtyEntry.where(id: @dirty.map(&:id)).delete_all if @dirty.present?
    end

    protected

    def self.extract_dirty(relation, blk)
      @dirty = DirtyEntry.all
      return unless @dirty.present?
      entry_ids = @dirty.map(&:entry_id)
      relation = relation.where('entries.id' => entry_ids)
      range_relation = Entry.where(id: entry_ids)
      extract_ranges(relation, range_relation, blk)
    end

    def self.extract_all(relation, blk)
      extract_ranges(relation, Entry, blk)
    end

    def self.extract_ranges(relation, range_relation, blk)
      week = range_relation.minimum(:measured_on).beginning_of_day
      max = range_relation.maximum(:measured_on).end_of_day
      while week < max
        new_relation = relation.where('measured_on >= ? AND measured_on < ?', week, week + 1.day)
        connection.select_all(new_relation.to_sql).each { |row| blk.call(row) }
        week += 1.day
      end
    end
  end
end
