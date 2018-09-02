Rails.application.routes.draw do
  resources :comments
  resources :tags
  resources :links do
    resources :comments, only: [:create, :index, :destroy]
  end
  devise_for :users
  resources :users

  authenticated :user do
    root 'users#dashboard'
  end
  root to: 'visitors#index'
end
