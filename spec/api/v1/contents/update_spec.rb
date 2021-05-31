require 'rails_helper'

RSpec.describe "contents#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/contents/#{content.id}", payload
  end

  describe 'basic update' do
    let!(:content) { create(:content) }

    let(:payload) do
      {
        data: {
          id: content.id.to_s,
          type: 'contents',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ContentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { content.reload.attributes }
    end
  end
end
