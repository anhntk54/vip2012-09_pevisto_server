class Order < ActiveRecord::Base
  attr_accessible :product_id, :quantily, :user_id
  belongs_to :user
  belongs_to :product
end
