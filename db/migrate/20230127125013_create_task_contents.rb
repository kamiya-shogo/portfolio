class CreateTaskContents < ActiveRecord::Migration[5.1]
  def change
    create_table :task_contents do |t|
      t.string :name
      t.string :edit_item
      t.string :edit_roast
      t.string :edit_grind
      t.string :add_cart_status
      t.string :edit_order_status
      t.references :user, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
