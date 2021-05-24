require 'rails_helper'

RSpec.describe "categories#create", type: :request do
  let!(:user) { create(:user, role: :admin) }
  let(:authorization_header) do
    access_token = jwt_and_refresh_token(user, 'user')[0]
    { 'Authorization': "Bearer #{access_token}" }
  end

  subject(:make_request) do
    jsonapi_post "/api/v1/categories", payload,
      headers: authorization_header
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
