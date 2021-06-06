class AttachmentResource < ApplicationResource
  self.model = ActiveStorage::Attachment
  attribute :record_type, :string
  attribute :record_id, :integer_id, only: [:filterable]
  attribute :filename, :string
  attribute :content_type, :string
end