class SessionsController < ApplicationController
  class AuthenticationError < StandardError; end

  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from AuthenticationError, with: :handle_authentication_error

  skip_before_action :verify_authenticity_token

  def create
    raise AuthenticationError unless user&.authenticate(params.require(:password))
    session[:user_id] = user.id
    render json: { user_id: user.id }, status: :created
  end

  private

  def parameter_missing(e)
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def handle_authentication_error
    head :unauthorized
  end

  def user
    @user ||= User.find_by(username: params.require(:username))
  end
end
