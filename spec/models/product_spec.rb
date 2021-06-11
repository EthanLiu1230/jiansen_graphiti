require 'rails_helper'

RSpec.describe Product, type: :model do
  it {should belong_to(:category).optional}
  it { should have_db_index(:name).unique }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
