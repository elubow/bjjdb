Rails.application.routes.draw do
  resources :translation_terms
  get 'translations', controller: :translation_terms, action: :search
  get 'translations/charts', controller: :translation_terms, action: :charts

  resources :instructors do
    collection do
      get 'search'
    end
  end
  resources :private_notes do
    collection do
      get 'search'
    end
  end
  get 'search/tags_for', controller: :search, action: :tags_for
  post 'search/targeted', controller: :search, action: :targeted
  get :search, controller: :search, action: :input
  post :search, controller: :search, action: :advanced
  get 'search/a', controller: :search, action: :autocomplete

  get 'stats/site', controller: :stats, action: :site

  get 'links/without_instructors', controller: :links, action: :index_without_instructors
  get 'links/tag_filter', controller: :links, action: :index_based_on_tags
  
  get 'validate/email', to: 'validations#email'
  get 'validate/instructor', to: 'validations#instructor'
  get 'validate/url', to: 'validations#url'
  
  resources :comments
  get 'notebook', controller: :private_notes, action: :notebook
  resources :tags
  resources :links do
    post :ratings, to: 'ratings#rate'
    patch :ratings, to: 'ratings#rate'
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
