require 'rails_helper'

RSpec.describe "contents#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/contents", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:content)
    end
    let(:payload) do
      {
        data: {
          type: 'contents',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ContentResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Content.count }.by(1)
    end
  end
end
