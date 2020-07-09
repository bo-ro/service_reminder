Rails.application.routes.draw do
  root 'cars#index'

  resources :cars
  resources :users, only: [:new, :create]
  resource :sessions, only: [:create, :destroy, :new]
  resources :messages, only: [:new ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
