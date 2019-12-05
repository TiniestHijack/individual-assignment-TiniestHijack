Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'
  resources :users
  resources :payments
  resources :purchases
  resources :credit_cards
  resources :addresses
  resources :customers
  resources :movies
  get 'movies/index'
  root 'movies#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
