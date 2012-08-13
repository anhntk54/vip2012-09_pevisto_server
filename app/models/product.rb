class Product < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader
  attr_accessible :describe, :user_id, :id_type, :inventory, :price, :product,:image
end
