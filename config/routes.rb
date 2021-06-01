Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.role == "admin" } do
    mount RailsAdmin::Engine => "/#{ENV['RAILS_ADMIN_ROUTE']}", as: 'rails_admin'
  end

  devise_for :users, only: :sessions

  root 'home#index'

  get 'como-contribuir', to: 'pages#contribute'

  resources :contents, only: [:index, :show], path: :conteúdos
  
  # errors routes
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
