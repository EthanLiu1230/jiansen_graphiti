require 'rails_helper'

RSpec.describe "pages#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/pages/#{page.id}", params: params
  end

  describe 'basic fetch' do
    let!(:page) { create(:page) }

    it 'works' do
      expect(PageResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('pages')
      expect(d.id).to eq(page.id)
    end
  end
end
