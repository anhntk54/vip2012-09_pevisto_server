# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user       :string(255)
#  mail       :string(255)
#  addr       :string(255)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :addr, :mail, :phone, :user,  :password, :password_confirmation ,:name, :gender, :birthday,:admin
  has_secure_password
  has_many :products, dependent: :destroy
  has_many :order , dependent: :destroy
  before_save { |user| user.mail = mail.downcase }
  before_save :create_remember_token
  
  validates :user,  presence: true, length: { maximum: 15 }
  validates :phone,  presence: true, length: { maximum: 11 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    
end
