Rails.application.routes.draw do
  resources :comments
  resources :tags
  resources :links do
    resources :comments, only: [:create, :index, :destroy]
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
