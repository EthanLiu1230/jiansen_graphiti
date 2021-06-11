class PageResource < ApplicationResource
  attribute :path, :string
  has_many :contents
end
