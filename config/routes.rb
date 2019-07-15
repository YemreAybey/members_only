Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :posts, only: [:new, :create, :index]
  get 'sessions/new'
  get 'sign_in', to: 'sessions#new'
  post   '/sign_in',   to: 'sessions#create'
  delete '/sign_out',  to: 'sessions#destroy'
end
