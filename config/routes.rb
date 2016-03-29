Rails.application.routes.draw do

  devise_for :users
  root 'store#index', as: 'store'

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :users, only: [:show]
  resources :carts
  resources :line_items, only: [:create, :update]
  resources :orders, only: [:show]

  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

  post 'carts/add_item', to: 'carts#add_item', as: 'add_item'
  post 'carts/subtract_item', to: 'carts#subtract_item', as: 'subtract_item'

end
