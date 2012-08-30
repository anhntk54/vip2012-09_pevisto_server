class RemoveIdtype < ActiveRecord::Migration
 def change
 	remove_column :products, :id_type
 end
end
