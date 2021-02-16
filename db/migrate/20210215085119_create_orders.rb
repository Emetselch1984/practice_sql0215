class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :amount,null: false
      t.datetime :order_time
      t.references :user,null: false, foreign_key: true
    end
    add_index :orders, :order_time
    add_index :orders,[:user_id,:order_time]
  end
end
