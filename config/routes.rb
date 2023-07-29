Rails.application.routes.draw do
  devise_for :users

  namespace :admin, path: ENV.fetch('ADMIN_ROUTE_PATH', '/admin') do
      resources :contents
      resources :categories
      resources :resources

      root to: "contents#index"
    end

  root "home#index"

  resources :contents, only: %i[show]
end
