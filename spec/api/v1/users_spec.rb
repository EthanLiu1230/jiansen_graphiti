require 'rails_helper'

RSpec.describe "users", type: :request do

  let!(:user) do
    create(:user,
      email: 'ethan@test.com',
      password: 'Password1',
      password_confirmation: 'Password1'
    )
  end

  describe 'sign_up' do
    it 'respond access_token in header' do
      jsonapi_post '/api/v1/users/sign_up', {
        "email": "ethan2@test.com",
        "password": "api_password",
        "password_confirmation": "api_password"
      }
      expect(response).to have_http_status(:ok)
      expect(response.header).to include('Access-Token')
    end
  end

  describe 'sign_in' do
    it 'respond access_token in header' do
      jsonapi_post '/api/v1/users/sign_in', {
        "email": "ethan@test.com",
        "password": "Password1"
      }
      expect(response).to have_http_status :ok
      expect(response.header).to include('Access-Token')
    end

    it 'respond given wrong credentials' do
      jsonapi_post '/api/v1/users/sign_in', {
        "email": "ethan@test.com",
        "password": "wrong_password"
      }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.header).not_to include('Access-Token')
      expect(JSON.parse(response.body)).to include('error' => match(/credentials/))
    end
  end

end