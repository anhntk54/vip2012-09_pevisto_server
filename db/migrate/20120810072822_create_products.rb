class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :id_com
      t.string :product
      t.string :describe
      t.integer :id_type
      t.integer :price
      t.integer :inventory

      t.timestamps
    end
  end
end
