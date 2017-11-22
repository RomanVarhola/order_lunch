Rails.application.routes.draw do
  root to: 'homes#index'

  devise_for :users
  resources :orders, only: [:index, :create, :destroy]
  resources :drinks
  resources :foods
  resources :menus
  resources :users
  resources :homes, only: :index

  namespace :api do
    namespace :v1 do
      resources :orders, only: [:index]
    end
  end
end
