Rails.application.routes.draw do
  get 'users/new'
  resources :cars
  resources :users, only: [:new, :create]
  resources :sessions, only: [:create] do
      collection do
        get 'logout' => 'sessions#destroy'
      end
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'cars#index'

  get "/logout", to: 'sessions#destroy'
end
