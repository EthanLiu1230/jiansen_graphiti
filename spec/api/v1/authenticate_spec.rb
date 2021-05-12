require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'post /authenticate' do
    let!(:payload) do
      {
        username: 'ethan@test.com',
        password: 'Password1'
      }
    end

    it 'can authenticate the client with token' do
      jsonapi_post '/api/v1/authenticate', payload

      expect(response).to have_http_status(:created)
      expect(response.body).to eq({
        token: '123'
      }.to_json)
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