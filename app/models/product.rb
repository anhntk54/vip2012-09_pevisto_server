class Product < ActiveRecord::Base
  belongs_to :user
  has_many :order, dependent: :destroy
  mount_uploader :image, ImageUploader
  attr_accessible :describe, :user_id, :id_type, :inventory, :price, :product,:image,:month

  attr_accessor :month,:year
end
