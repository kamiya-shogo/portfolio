class RemoveItemFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :edit_item, :string
    remove_column :tasks, :edit_roast, :string
    remove_column :tasks, :edit_grind, :string
  end
end
