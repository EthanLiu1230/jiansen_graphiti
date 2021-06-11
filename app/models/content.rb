class Content < ApplicationRecord
  has_many_attached :images
  belongs_to :page, optional: true
  validates :name, uniqueness: { scope: :page_id }, presence: true
end
