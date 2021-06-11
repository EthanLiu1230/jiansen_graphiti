class Page < ApplicationRecord
  validates :path, uniqueness: true, presence: true
  has_many :contents
end
