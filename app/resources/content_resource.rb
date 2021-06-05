class ContentResource < ApplicationResource
  attribute :title, :string
  polymorphic_has_many :images, as: :record, resource: AttachmentResource
end
