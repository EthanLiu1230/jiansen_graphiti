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
    it "can append multiple images" do
      expect {
        make_request
        expect(content.images.attached?).to be true
        expect(response).to have_http_status(:created)
      }.to change { content.images.count }.from(0).to(2)
    end
  end

  describe 'destroy actions' do
    before(:example) do
      content.images.attach(images)
    end
    describe '#destroy(:id)' do
      let(:image_to_delete) { content.images.find { |img| img.filename == 'test2.png' } }
      let(:make_request) { delete "/api/v1/contents/#{content.id}/images/#{image_to_delete.id}" }
      it "works" do
        expect {
          make_request
        }.to change { content.images.count }.by(-1)
        expect(response).to have_http_status(:ok)
      end
    end

    describe '#destroy_all' do
      let(:make_request) { delete "/api/v1/contents/#{content.id}/images" }
      it 'works' do
        expect {
          make_request
        }.to change { content.images.count }.by(-2)
        expect(response).to have_http_status(:ok)
      end
    end
  end

end
