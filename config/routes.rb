Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/destroy'
    get 'users/update'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
    get 'orders/edit'
    get 'orders/update'
  end
  namespace :admin do
    get 'products/index'
    get 'products/show'
    get 'products/edit'
    get 'products/new'
    get 'products/search'
    get 'products/destroy'
    get 'products/create'
    get 'products/update'
  end
  get 'carts/show'
  get 'carts/buy'
  get 'carts/result'
  get 'orders/show'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/destroy'
  get 'customers/update'
  get 'products/index'
  get 'products/show'
  get 'products/search'
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
