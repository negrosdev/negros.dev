Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
      resources :contents
      resources :categories

      root to: "contents#index"
    end
  root "home#index"

  resources :contents, only: %i[show]
end
