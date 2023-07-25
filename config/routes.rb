Rails.application.routes.draw do
  root "home#index"

  resources :contents, only: %i[show]
end
