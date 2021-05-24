class ApplicationController < ActionController::API
  include Graphiti::Rails::Responders
  include ActionPolicy::Controller
  authorize :user, through: :current_user
  verify_authorized
end
