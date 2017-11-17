Rails.application.routes.draw do
  resources :order_drinks
  resources :order_foods
  root to: 'homes#index'

  devise_for :users
  resources :orders
  resources :drinks
  resources :foods
  resources :menus
  resources :users
  resources :homes, only: :index
end
