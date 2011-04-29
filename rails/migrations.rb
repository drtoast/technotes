### CREATING TABLES
class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
 
  def self.down
    drop_table :products
  end
end

### CHANGING TABLES
class ChangeProducts < ActiveRecord::Migration

  def self.up
    change_table :products do |t|
      t.remove :description, :name
      t.string :part_number
      t.index :part_number
      t.rename :upccode, :upc_code
      t.timestamps
      t.references :category
    end
    
    # OR:
    remove_column :products, :description
    remove_column :products, :name
    add_column :products, :part_number, :string
    add_index :products, :part_number
    rename_column :products, :upccode, :upc_code
  end
end
