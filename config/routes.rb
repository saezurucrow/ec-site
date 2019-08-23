Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:index,:show,:edit,:destroy,:update]
    resources :orders, only: [:index,:show,:edit,:update]
    resources :products
    resources :artists , only: [:create,:new]
    resources :labels , only: [:create,:new]
    resources :genres , only: [:create,:new]
    get 'products/search'

    get     'login',   to: 'sessions#new'
    post    'login',   to: 'sessions#create'
    delete  'logout',  to: 'sessions#destroy'
  end

  resources :carts, only: [:show]
  get 'carts/buy'
  get 'carts/result'

  resources :orders, only: [:show]

  devise_for :customers
  resources :customers, only: [:show,:edit,:destroy,:update]

  resources :products, only: [:index,:show]
  get 'products/search'

  root 'products#index'
end
