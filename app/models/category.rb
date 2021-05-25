class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', foreign_key: 'parent_id', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_id', dependent: :nullify

  validates :name, uniqueness: { scope: :parent_id }
end
