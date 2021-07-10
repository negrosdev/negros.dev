Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.role == "admin" } do
    mount RailsAdmin::Engine => "/#{ENV['RAILS_ADMIN_ROUTE'] || 'admin'}", as: 'rails_admin'
  end

  devise_for :users, only: :sessions

  root 'home#index'

  resources :posts, only: %i[index show]
  resources :contents, only: %i[show], path: :conteudos do
    member do
      get '/trilha/:track_id', to: 'contents#track', as: 'tracks'
    end
  end
  
  # errors routes
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
