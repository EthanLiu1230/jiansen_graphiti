class ApplicationController < ActionController::API
  include Graphiti::Rails::Responders
  include Pundit
end
