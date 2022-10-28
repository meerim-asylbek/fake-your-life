Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :artists, only: [:index]
    # resources :reviews, only: %i[create]
  # resources :reviews, only: %i[destroy]
  resources :users do
    resources :artists, only: %i[new create show edit update]
  end
  resources :users do
    resources :customers, only: %i[new create show edit update]
  end

  # resources :users do
  #   resources :artists, only: %i[index new create show edit update]
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
