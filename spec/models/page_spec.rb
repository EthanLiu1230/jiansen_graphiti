require 'rails_helper'

RSpec.describe Page, type: :model do
  it { should have_db_index(:path) }
  it {should validate_presence_of(:path)}
  it { should validate_uniqueness_of(:path) }

  it { should have_many(:contents) }

end
