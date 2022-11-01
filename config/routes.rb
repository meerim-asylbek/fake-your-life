Rails.application.routes.draw do
  get 'hire_adds/create'
  devise_for :users

  root to: "pages#home"

  resources :customers do
    resources :reviews, only: %i[create edit update]
  end
  resources :artists do
     resources :reviews, only: %i[create]
     resources :hires, only: %i[create]
     resources :hire_adds, only: %i[create]
  end
  resources :reviews, only: %i[destroy]
  resources :hires, only: %i[destroy]






  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
