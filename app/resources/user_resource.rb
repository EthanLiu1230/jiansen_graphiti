class UserResource < ApplicationResource
  attribute :name, :string
  attribute :email, :string
  attribute :password, :string
  attribute :role, :string_enum, allow: %w[admin super_admin]
end
