Rails.application.routes.draw do
  resources :cars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'cars#index'

  get "/logout", to: 'sessions#destroy'
end
