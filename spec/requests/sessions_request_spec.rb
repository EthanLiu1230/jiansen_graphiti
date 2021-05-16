require 'rails_helper'

RSpec.describe SessionsController, type: :request do

  describe '#create' do
    let!(:ethan) { create(:user, username: 'ethan@test.com', password: 'Password1') }

    context 'parameter missing' do
      it 'requires username attribute' do
        jsonapi_post '/api/v1/sessions', { password: 'Password1' }
        expect(response).to have_http_status :unprocessable_entity
        expect(JSON.parse(response.body)).to include('error' => match(/username/))
      end

      it 'requires password attribute' do
        jsonapi_post '/api/v1/sessions', { username: 'ethan@test.com' }
        expect(response).to have_http_status :unprocessable_entity
        expect(JSON.parse(response.body)).to include('error' => match(/password/))
      end

    end

    context 'it can authenticate' do
      it 'returns unauthorized given wrong username' do
        jsonapi_post '/api/v1/sessions', { username: 'i_am_not_exist', password: 'Password1' }
        expect(response).to have_http_status :unauthorized
      end

      it 'returns unauthorized given wrong password' do
        jsonapi_post '/api/v1/sessions', { username: 'ethan@test.com', password: 'wrong password' }
        expect(response).to have_http_status :unauthorized
      end

      it 'setup session[:user_id]' do
        jsonapi_post '/api/v1/sessions', { username: 'ethan@test.com', password: 'Password1' }
        expect(response).to have_http_status :created
        expect(session).to include :user_id
      end
      it 'returns :created'
      it 'returns cookies'
    end
  end

  describe 'logged_in' do

  end

  describe '#log_out' do

  end

end
