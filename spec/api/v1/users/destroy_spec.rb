require 'rails_helper'
require 'shared/context/with_token'

RSpec.describe "users#destroy", type: :request do
  include_context 'with token'

  subject(:make_request) do
    jsonapi_delete "/api/v1/users/#{user.id}", headers: bear_super_admin_token
  end

  describe 'basic destroy' do
    let!(:user) { create(:user) }

    it 'updates the resource' do
      expect(UserResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { User.count }.by(-1)
      expect { user.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
