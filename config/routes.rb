Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # authenticated(:user) do
  #   root "atrists#index"
  # end

  # unauthenticated(:user) do
  #   root "pages#landing"
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
