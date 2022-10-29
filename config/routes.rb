Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: "pages#home"
  resources :artists do
    resources :reviews, only: [:create]
    resources :customers, only: [:create]
  end

  resources :users do
    resources :artists, only: %i[new create show edit update]
  end
  resources :users do
    resources :customers, only: %i[new create show edit update]
  end

  # resources :users do
  #   resources :artists, shallow: true
  # end

  # resources :artists do
  #   resources :hires, shallow: true
  # end

  # resources :users do
  #   resources :artists, only: %i[index new create show edit update]
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
