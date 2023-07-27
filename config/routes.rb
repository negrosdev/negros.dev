Rails.application.routes.draw do
  namespace :admin do
      resources :contents

      root to: "contents#index"
    end
  root "home#index"

  resources :contents, only: %i[show]
end
