Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'top#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :events do
    get :guests_index, on: :member, controller: :events
  end
  resources :users, only: [:show]
  resources :attends, only: [:create, :destroy]
  resources :joins, only: [:create, :destroy]
  resources :contacts, only: [:new, :create, :index]

  resources :groups do
    get :preview, on: :member
    resources :comments
  end
end
