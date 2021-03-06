Rails.application.routes.draw do

  #get 'password_resets/new'
#
  #get 'password_resets/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'movies/index'

  get 'movies/show'

  get 'users/new'

  get 'users/index'

  get 'users/show'

  get 'users/edit'
  
  get '/signup', to: 'users#new'
  
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'

  post   '/login',   to: 'sessions#create'
  
  delete '/logout',  to: 'sessions#destroy'

  root 'static_pages#home'

  resources :users

  resources :movies

  resources :account_activations, only: [:edit]

  resources :password_resets, only: [:new, :create, :edit, :update]
  
end
