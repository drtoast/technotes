=begin
http://api.rubyonrails.org/classes/ActiveRecord/Migration.html

rails g migration AddStuffToProduct name:string price:decimal
=end


### CREATING TABLES
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end

### CHANGING TABLES
class ChangeProducts < ActiveRecord::Migration

  def up
    change_table :products do |t|
      t.remove :description, :name
      t.string :part_number
      t.index :part_number
      t.rename :upccode, :upc_code
      t.timestamps
      t.references :category
    end
    
    # OR:

    # add:
    add_column :products, :part_number, :string
    add_index :products, :part_number
    create_table :products do |t|

    end

    # change:
    change_column
    change_table 
    rename_column :products, :upccode, :upc_code

    # delete:
    remove_column :products, :description
    remove_index

  end
end


### column types
:string, :text, :integer, :float, :decimal, :datetime, :timestamp, :time, :date, :binary, :boolean
