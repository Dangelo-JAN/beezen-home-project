Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  resources :roles
  resources :tasks
  resources :alerts
  resources :tags

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
