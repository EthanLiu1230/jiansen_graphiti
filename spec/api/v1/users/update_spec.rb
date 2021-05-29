require 'rails_helper'
require 'shared/context/with_token'

RSpec.describe "users#update", type: :request do
  include_context 'with token'
  subject(:make_request) do
    jsonapi_put "/api/v1/users/#{user.id}", payload, headers: bear_super_admin_token
  end

  describe 'basic update' do
    let!(:user) { create(:user) }

    let(:payload) do
      {
        data: {
          id: user.id.to_s,
          type: 'users',
          attributes: {
            # ... your attrs here
            name: 'new name'
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    it 'updates the resource' do
      expect(UserResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { user.reload.attributes }
    end
  end
end