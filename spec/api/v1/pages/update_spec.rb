require 'rails_helper'

RSpec.describe "pages#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/pages/#{page.id}", payload
  end

  describe 'basic update' do
    let!(:page) { create(:page) }

    let(:payload) do
      {
        data: {
          id: page.id.to_s,
          type: 'pages',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(PageResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { page.reload.attributes }
    end
  end
end
