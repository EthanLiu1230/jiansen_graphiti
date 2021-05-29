Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    api_guard_routes for: 'users'
    resources :users
    resources :categories
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
