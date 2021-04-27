Rails.application.routes.draw do
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  get 'como-contribuir', to: 'pages#contribute'

  authenticate :user, lambda { |u| u.role == "admin" } do
    mount RailsAdmin::Engine => "/#{ENV['RAILS_ADMIN_ROUTE']}", as: 'rails_admin'
  end

  devise_for :users, only: :sessions

  root 'home#index'

  resources :courses, only: [:index, :show], path: :treinamentos do
    get 'categorias', to: 'courses#category', on: :member
    member do
      get 'video'
    end
  end
end
