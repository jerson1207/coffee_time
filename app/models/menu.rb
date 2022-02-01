class Menu < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true

  has_many :orders
  has_one_attached :image

end
