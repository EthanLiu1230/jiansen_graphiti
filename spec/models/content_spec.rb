require 'rails_helper'

RSpec.describe Content, type: :model do

  it { should have_many_attached(:images) }

  it { should validate_presence_of(:name) }
  it { should have_db_index([:name, :page_id]).unique }
  it { should validate_uniqueness_of(:name).scoped_to(:page_id) }

  it { should belong_to(:page).optional }

  it { should have_db_column(:title) }
  it { should have_db_column(:body) }
  it { should have_db_column(:subtitle) }
end
