class Sector < ApplicationRecord
  has_many :products, dependent: :destroy
end
