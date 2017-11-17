Rails.application.routes.draw do
  root to: 'homes#index'

  devise_for :users
  resources :orders
  resources :drinks
  resources :foods
  resources :menus
  resources :users
  resources :homes, only: :index
end
