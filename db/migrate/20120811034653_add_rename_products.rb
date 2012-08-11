class AddRenameProducts < ActiveRecord::Migration
  def change
    rename_column :products, :id_com, :user_id
    end
end
