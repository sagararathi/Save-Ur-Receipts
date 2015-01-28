class Category < ActiveRecord::Base
  has_many :receipts

  validates :title, presence: true, uniqueness: true
end
