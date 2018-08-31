Rails.application.routes.draw do
  resources :links
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
