Rails.application.routes.draw do
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  mount RailsAdmin::Engine => '/supervisor', as: 'rails_admin'

  devise_for :users, only: :sessions

  root 'home#index'

  resources :courses, only: [:index, :show], path: :cursos do
    get 'categorias', to: 'courses#category', on: :member
    member do
      get 'video'
    end
  end

  resources :authors, only: [:index], path: :instrutores
end
