Rails.application.routes.draw do
  get 'users/show'
  root to: 'events#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    #sessions: 'users/sessions',
  }

  resources :events

  resources :users, only: [:show]

end
