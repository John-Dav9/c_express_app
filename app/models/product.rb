class Product < ApplicationRecord
  belongs_to :sector
  has_one_attached :image

  validates_presence_of :name
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
