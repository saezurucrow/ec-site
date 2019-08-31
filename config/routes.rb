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

  resources :orders, only: [:show]

  devise_for :customers
  resources :customers, only: [:show,:edit,:destroy,:update]

  resources :products, only: [:index,:show]
  get 'products/search'

  resources :carts, only: [:show]

  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'

  root 'products#index'
end
