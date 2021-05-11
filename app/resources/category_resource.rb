class CategoryResource < ApplicationResource
  self.filters_accept_nil_by_default = true

  attribute :name, :string
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :parent_id, :integer, readable: false

  belongs_to :parent, foreign_key: :parent_id, resource: CategoryResource
  has_many :children, foreign_key: :parent_id, resource: CategoryResource

end
