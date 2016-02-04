Rails.application.routes.draw do

  root 'sessions#new'

  get '/restaurants/all_restaurants' => 'restaurants#all_restaurants'


  resources :restaurants do
    resources :reservations, only: [:show, :create, :destroy]
    resources :reviews, only: [:show, :create, :destroy]
  end

  resources :users, only: [:new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end
