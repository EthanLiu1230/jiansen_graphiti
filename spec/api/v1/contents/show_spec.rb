require 'rails_helper'

RSpec.describe "contents#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/contents/#{content.id}", params: params
  end

  describe 'basic fetch' do
    let!(:content) { create(:content) }

    it 'works' do
      expect(ContentResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('contents')
      expect(d.id).to eq(content.id)
    end
  end
end
