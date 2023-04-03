Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :roles
  resources :tasks
  resources :alerts
  resources :tags

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
