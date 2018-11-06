Rails.application.routes.draw do # frozen_string_literal: true
  root 'welcome#index'

  resources :users
  resources :sessions, only: %i[new create destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'signin', to: 'sessions#new', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :stocks
end
