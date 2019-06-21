Rails.application.routes.draw do
  root to: 'events#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  resources :events
  resources :users, only: [:show]
  resources :attends, only: [:create, :destroy]
  resources :contacts, only: [:new, :create]

  resources :groups do
    resources :comments
  end
end
