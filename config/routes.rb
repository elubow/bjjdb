Rails.application.routes.draw do
  resources :tags
  resources :links
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
