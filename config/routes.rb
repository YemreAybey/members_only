Rails.application.routes.draw do
  get 'sessions/new'
  get 'sign_in', to: 'sessions#new'
  post   '/sign_in',   to: 'sessions#create'
  delete '/sign_out',  to: 'sessions#destroy'
  resources :users
  root 'users#index'
end
