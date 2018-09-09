Rails.application.routes.draw do
  get :search, controller: :search, action: :input
  get 'search/a', controller: :search, action: :autocomplete

  resources :comments
  resources :tags
  resources :links do
    resources :comments, only: [:create, :index, :destroy]
  end
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  resources :users

  authenticated :user do
    root 'users#dashboard'
  end
  root to: 'visitors#index'
end
