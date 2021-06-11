require 'rails_helper'

RSpec.describe "pages#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/pages", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:page)
    end
    let(:payload) do
      {
        data: {
          type: 'pages',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(PageResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Page.count }.by(1)
    end
  end
end
