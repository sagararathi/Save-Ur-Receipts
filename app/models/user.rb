class User < ActiveRecord::Base
  has_secure_password
  has_many :receipts

  validates :username, :password, :password_confirmation, :email, presence: true
  validates :username, :email, uniqueness: truegit  
end
