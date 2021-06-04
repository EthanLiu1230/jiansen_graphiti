require 'rails_helper'

RSpec.describe "images", type: :request do

  let!(:content) { create(:content) }
  let(:images) do
    [
      fixture_file_upload('test1.png', 'image/png'),
      fixture_file_upload('test2.png', 'image/png')
    ]
  end

  describe '#create' do
    let(:make_request) do
      post "/api/v1/contents/#{content.id}/images", params: { images: images }
    end
    it "can add multiple images" do
      expect {
        make_request
        expect(content.images.attached?).to be true
        expect(response).to have_http_status(:created)
      }.to change { content.images.count }.from(0).to(2)
    end
  end

  describe '#update' do
    let(:make_request) do
      put "/api/v1/contents/#{content.id}/images", params: { images: images }
    end
  end
end
