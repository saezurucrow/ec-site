Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:index,:show,:edit,:destroy,:update]
  end

  namespace :admin do
    resources :orders, only: [:index,:show,:edit,:update]
  end
  namespace :admin do
    resources :products
    get 'products/search'
  end

  resources :carts, only: [:show]
  get 'carts/buy'
  get 'carts/result'

  resources :orders, only: [:show]

  devise_for :customers
  resources :customers, only: [:show,:edit,:destroy,:update]

  resources :products, only: [:index,:show]
  get 'products/search'
end
