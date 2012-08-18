class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantily

      t.timestamps
    end
  end
end
