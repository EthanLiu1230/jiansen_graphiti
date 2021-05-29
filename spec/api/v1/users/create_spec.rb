require 'rails_helper'
require 'shared/context/with_token'

RSpec.describe "users#create", type: :request do
  include_context 'with token'

  subject(:make_request) do
    jsonapi_post "/api/v1/users", payload, headers: bear_super_admin_token
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:user)
    end
    let(:payload) do
      {
        data: {
          type: 'users',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(UserResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { User.count }.by(1)
    end
  end
end
