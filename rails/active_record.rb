### Querying

# http://guides.rubyonrails.org/active_record_querying.html

# Finder methods that return an instance of ActiveRecord::Relation:

# where
# select
# group
# order
# limit
# offset
# joins
# includes
# lock
# readonly
# from
# having

# Chaining finder methods (lazy execution)
Client.select("viewable_by, locked").where(:locked => true).limit(5).offset(10).order("created_at DESC")
Client.where(:orders_count => [1,3,5])

# Find in batches
User.find_each(:batch_size => 5000) do |user|
  NewsLetter.weekly_deliver(user)
end

# Grouping
Order.group("date(created_at)").having("created_at > ?", 1.month.ago)

# Joins
time_range = (Time.now.midnight - 1.day)..Time.now.midnight
Client.joins(:orders).where(:orders => {:created_at => time_range})

# Eager loading of associations
Category.includes(:posts => [{:comments => :guest}, :tags]).find(1)
