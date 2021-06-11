class ContentResource < ApplicationResource
  attribute :name, :string
  attribute :title, :string
  attribute :subtitle, :string
  attribute :body, :string
  polymorphic_has_many :images, as: :record, resource: ImageResource
  attribute :page_id, :integer, only: [:filterable]
  belongs_to :page
end
