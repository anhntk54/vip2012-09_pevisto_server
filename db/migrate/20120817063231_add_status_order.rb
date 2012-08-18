class AddStatusOrder < ActiveRecord::Migration
  	def change
  		add_column :orders, :status, :boolean, default: false
  	end
end
