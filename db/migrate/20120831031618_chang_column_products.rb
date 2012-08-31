class ChangColumnProducts < ActiveRecord::Migration
  def change
    rename_column :products, :product, :name
    end
end
