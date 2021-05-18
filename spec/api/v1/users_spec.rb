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
    it 'returns access_token in header' do
      jsonapi_post '/api/v1/users/sign_in', {
        "email": "ethan@test.com",
        "password": "Password1"
      }
      expect(response).to have_http_status :ok
      expect(response.header).to include('Access-Token')
    end

    it 'returns unprocessable_entity given wrong credentials' do
      jsonapi_post '/api/v1/users/sign_in', {
        "email": "ethan@test.com",
        "password": "wrong_password"
      }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.header).not_to include('Access-Token')
      expect(JSON.parse(response.body)).to include('error' => match(/credentials/))
    end
  end

  context 'authenticated user' do

    let!(:access_token) do
      access_token, _refresh_token = jwt_and_refresh_token(user, 'user')
      access_token
    end

    let!(:blacklisted_token) do
      create(:blacklisted_token, token: 'abc.efg.adw', user: user)
    end

    it 'allows to change password' do
      jsonapi_patch '/api/v1/users/passwords', {
        "password": "api_password_new",
        "password_confirmation": "api_password_new"
      }, headers: { 'Authorization': "Bearer #{access_token}" }
      expect(response).to have_http_status :ok
      expect(JSON.parse(response.body)).to include("status" => "success")
    end

    it 'reject blacklisted_token to change password' do
      jsonapi_patch '/api/v1/users/passwords', {
        "password": "api_password_new",
        "password_confirmation": "api_password_new"
      }, headers: { 'Authorization': "Bearer #{blacklisted_token}" }
      expect(response).to have_http_status :unauthorized
    end

    it 'sign_out user by adding token to blacklisted_tokens' do
      expect {
        jsonapi_delete '/api/v1/users/sign_out', headers: { 'Authorization': "Bearer #{access_token}" }
      }.to change { BlacklistedToken.count }.by(1)
    end

  end

  context "expired token" do
    let(:expired_token) {
      access_token, _refresh_token = jwt_and_refresh_token(user, 'user', true)
      access_token
    }
    it 'reject expired_token to change password' do
      jsonapi_patch '/api/v1/users/passwords', {
        "password": "api_password_new",
        "password_confirmation": "api_password_new"
      }, headers: { 'Authorization': "Bearer #{expired_token}" }
      expect(response).to have_http_status :unauthorized
    end
  end

end