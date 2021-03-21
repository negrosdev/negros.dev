Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/supervisor', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :courses, only: [:index, :show]
end
