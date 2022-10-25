Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :artists, only: %i[index show] do
    resources :reviews, only: %i[create]
  end
  resources :reviews, only: %i[destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
