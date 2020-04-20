# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: %i[index show edit destroy update]
    resources :orders, only: %i[index show edit update]
    resources :products, only: %i[index show edit new create update]
    resources :artists, only: %i[create new]
    resources :labels, only: %i[create new]
    resources :genres, only: %i[create new]
    get 'products/search'
    patch 'product/destroy/:id' => 'products#destroy', as: 'products/destory'

    get     'login',   to: 'sessions#new'
    post    'login',   to: 'sessions#create'
    delete  'logout',  to: 'sessions#destroy'
  end

  get 'orders/show', to: 'orders#show'
  get 'orders/select'
  post 'orders/confirm'
  get 'orders/complete'

  devise_for :customers
  resources :customers, only: %i[show edit destroy update]

  resources :products, only: %i[index show]
  get 'products/search'

  resources :carts, only: [:show]

  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'

  resources :addresses, only: %i[edit update destory create new]

  root 'products#index'
end
