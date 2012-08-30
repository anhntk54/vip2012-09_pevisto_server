class AddIdexProduct < ActiveRecord::Migration
  def change
  	add_index  :products, :product
  end
end
