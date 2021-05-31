require 'rails_helper'

RSpec.describe "contents#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/contents", params: params
  end

  describe 'basic fetch' do
    let!(:content1) { create(:content) }
    let!(:content2) { create(:content) }

    it 'works' do
      expect(ContentResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['contents'])
      expect(d.map(&:id)).to match_array([content1.id, content2.id])
    end
  end
end
