class AddUserNameToTaskContents < ActiveRecord::Migration[5.1]
  def change
    add_column :task_contents, :user_name, :string
    add_column :task_contents, :price, :integer
    add_column :task_contents, :sum_price, :integer
    add_column :users, :sum_price, :integer
  end
end
