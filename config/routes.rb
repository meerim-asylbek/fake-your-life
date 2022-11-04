Rails.application.routes.draw do
  get 'hire_adds/create'
  devise_for :users

  root to: "pages#home"

  resources :customers, except: %i[index] do
    resources :hires, only: %i[show edit update]
    resources :reviews, only: %i[create edit update]
  end
  resources :artists do
    resources :hires, only: %i[create]
    resources :reviews, only: %i[create]
  end
  resources :reviews, only: %i[destroy]
  resources :hires, only: %i[destroy]

  get '/dashboard', to: 'artists#dashboard', as: 'dashboard'
  get '/profile/:id', to: 'customers#profile', as: 'profile'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
