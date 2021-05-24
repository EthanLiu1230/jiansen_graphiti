require 'rails_helper'
require 'shared/context/with_admin_token'

RSpec.describe "categories#create", type: :request do
  include_context 'with_admin_token'

  subject(:make_request) do
    jsonapi_post "/api/v1/categories", payload,
      headers: with_admin_token
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:category)
    end
    let(:payload) do
      {
        data: {
          type: 'categories',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(CategoryResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Category.count }.by(1)
    end
  end
end
