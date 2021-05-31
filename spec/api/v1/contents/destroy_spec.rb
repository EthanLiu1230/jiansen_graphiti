require 'rails_helper'

RSpec.describe "contents#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/contents/#{content.id}"
  end

  describe 'basic destroy' do
    let!(:content) { create(:content) }

    it 'updates the resource' do
      expect(ContentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Content.count }.by(-1)
      expect { content.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
