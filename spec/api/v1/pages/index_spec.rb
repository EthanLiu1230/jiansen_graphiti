require 'rails_helper'

RSpec.describe "pages#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/pages", params: params
  end

  describe 'basic fetch' do
    let!(:page1) { create(:page) }
    let!(:page2) { create(:page) }

    it 'works' do
      expect(PageResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['pages'])
      expect(d.map(&:id)).to match_array([page1.id, page2.id])
    end
  end
end
