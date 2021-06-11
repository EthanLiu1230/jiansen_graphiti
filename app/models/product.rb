class Product < ApplicationRecord
  belongs_to :category, optional: true
  validates :name, presence: true, uniqueness: true
end
