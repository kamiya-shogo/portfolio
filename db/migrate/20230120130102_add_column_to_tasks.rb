class AddColumnToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :edit_item, :string
    add_column :tasks, :edit_roast, :string
    add_column :tasks, :edit_grind, :string
    
    add_column :tasks, :add_cart_status, :string
    add_column :tasks, :price, :integer
  end
end
