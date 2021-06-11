require 'rails_helper'

RSpec.describe "pages#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/pages/#{page.id}"
  end

  describe 'basic destroy' do
    let!(:page) { create(:page) }

    it 'updates the resource' do
      expect(PageResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Page.count }.by(-1)
      expect { page.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
