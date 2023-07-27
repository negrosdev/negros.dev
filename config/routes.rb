Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
      resources :contents

      root to: "contents#index"
    end
  root "home#index"

  resources :contents, only: %i[show]
end
