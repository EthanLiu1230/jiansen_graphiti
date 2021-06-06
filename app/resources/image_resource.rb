class ImageResource < AttachmentResource
  attribute :url, :string do
    Rails.application.routes.url_helpers.url_for(@object)
  end
end