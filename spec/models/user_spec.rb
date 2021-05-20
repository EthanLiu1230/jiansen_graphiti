require 'rails_helper'

RSpec.describe User, type: :model do
  it do
    should define_enum_for(:role).
      with_values(
        admin: 'admin',
        super_admin: 'super_admin'
      ).backed_by_column_of_type :string
  end
end
