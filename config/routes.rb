Rails.application.routes.draw do
  get 'products/index'
  get 'carts/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :products

  resources :carts, only: [:show]

  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#delete_item'
  delete '/delete_item' => 'carts#delete_item'

  root 'products#index'
end
