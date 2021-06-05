class AttachmentResource < ApplicationResource
  self.model = ActiveStorage::Attachment
  attribute :record_type, :string
  attribute :filename, :string
  attribute :url, :string do
    Rails.application.routes.url_helpers.url_for(@object)
  end
  attribute :content_type, :string
end