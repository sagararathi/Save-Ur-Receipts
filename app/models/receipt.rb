class Receipt < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :title, :url, presence: true
end
