Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/supervisor', as: 'rails_admin'

  devise_for :users, only: :sessions

  root 'home#index'

  resources :courses, only: [:index, :show], path: :cursos do
    get 'categorias', to: 'courses#category', on: :member
  end

  resources :authors, only: [:index], path: :instrutores
end
