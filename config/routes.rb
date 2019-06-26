Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'events#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :events
  resources :users, only: [:show]
  resources :attends, only: [:create, :destroy]
  resources :joins, only: [:create, :destroy]
  resources :contacts, only: [:new, :create, :index]

  resources :groups do
    resources :comments
  end
end
