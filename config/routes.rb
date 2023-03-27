Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  # resources :tasks, only: [:new, :create] do
  #   resources :alerts, only: [:new, :create] do
  #     resources :tags, only: [:new, :create]
  #   end
  # end

  # resources :tasks, only: [:index, :show, :edit, :update, :destroy]
  # resources :alerts, only: [:index, :show, :edit, :update, :destroy]
  # resources :tags, only: [:index, :show, :edit, :update, :destroy]

  resources :roles
  resources :tasks
  resources :alerts
  resources :tags

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
