Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :artists do
    resources :reviews, only: %i[create]
  end
  resources :reviews, only: %i[destroy]

  resources :users do
    resources :customers, only: %i[new create show edit update]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
