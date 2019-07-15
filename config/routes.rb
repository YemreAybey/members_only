# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :posts, only: %i[new create index]
  get 'sessions/new'
  get 'sign_in', to: 'sessions#new'
  get '/create_post', to: 'posts#new'
  post   '/sign_in',   to: 'sessions#create'
  delete '/sign_out',  to: 'sessions#destroy'
end
