require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'post /authenticate' do
    let!(:valid_credentials) do
      {
        username: 'ethan@test.com',
        password: 'Password1'
      }
    end

    let!(:valid_user) do
      create(:user, valid_credentials)
    end

    describe 'it can authenticate client' do
      it 'returns token given valid credentials' do
        jsonapi_post '/api/v1/authenticate', valid_credentials

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to include('token')
      end

      it 'returns unauthorized error given invalid credentials' do
        jsonapi_post '/api/v1/authenticate', { username: 'ethan@test.com', password: 'wrong_password' }

        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'parameter_missing' do
      it 'returns error when username is missing' do
        jsonapi_post '/api/v1/authenticate', { password: 'Password1' }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error when password is missing' do
        jsonapi_post '/api/v1/authenticate', { username: 'ethan@test.com' }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

  end
end