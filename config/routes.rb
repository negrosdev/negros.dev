Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.role == "admin" } do
    mount RailsAdmin::Engine => "/#{ENV['RAILS_ADMIN_ROUTE']}", as: 'rails_admin'
  end

  devise_for :users, only: :sessions

  root 'home#index'

  get 'como-contribuir', to: 'pages#contribute'

  resources :contents, only: %i[index show], path: :conteudos
  resources :tags, only: %i[index show], param: :name
  
  # errors routes
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  # external links
  get '/discord', to: redirect('https://discord.com/invite/zd3eysQWrf')
end
