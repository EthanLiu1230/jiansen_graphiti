require 'rails_helper'

RSpec.describe "images", type: :request do
  let!(:content) { create(:content) }
  let(:images) { [fixture_file_upload('test.png', 'image/png')] }
  describe '#create' do
    let(:make_request) do
      post "/api/v1/contents/#{content.id}/images", params: { images: images }
    end
    it "works" do
      make_request
      expect(content.images.attached?).to be_true
    end
  end
end
