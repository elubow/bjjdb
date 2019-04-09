Rails.application.routes.draw do
  resources :instructors
  get :search, controller: :search, action: :input
  post :search, controller: :search, action: :advanced
  get 'search/a', controller: :search, action: :autocomplete

  get 'stats/site', controller: :stats, action: :site

  get 'links/admin', controller: :links, action: :admin_index

  get 'validate/email', to: 'validations#email'
  get 'validate/instructor', to: 'validations#instructor'
  get 'validate/url', to: 'validations#url'

  resources :comments
  resources :private_notes
  get 'notebook', controller: :private_notes, action: :notebook
  resources :tags
  resources :links do
    resources :comments, only: [:create, :index, :destroy]
    resource :favorite, only: [:create, :destroy]
  end
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users do
    get 'favorites'
  end

  authenticated :user do
    root 'users#dashboard'
  end
  root to: 'visitors#index'
end
