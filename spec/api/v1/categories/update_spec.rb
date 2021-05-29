require 'rails_helper'
require 'shared/context/with_token'

RSpec.describe "categories#update", type: :request do
  include_context 'with token'
  subject(:make_request) do
    jsonapi_put "/api/v1/categories/#{category.id}", payload, headers: bear_admin_token
  end

  describe 'basic update' do
    let!(:category) { create(:category) }

    let(:payload) do
      {
        data: {
          id: category.id.to_s,
          type: 'categories',
          attributes: {
            # ... your attrs here
            name: 'updated category'
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    it 'updates the resource' do
      expect(CategoryResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { category.reload.attributes }
    end
  end
end
