Rails.application.routes.draw do
  get 'hire_adds/create'
  devise_for :users
  #, :controllers => {:registrations => "registrations"}

  root to: "pages#home"
  resources :customers, except: %i[index]
  resources :artists do
     resources :reviews, only: %i[create]
     resources :hires, only: %i[create]
     resources :hire_adds, only: %i[create]
  end
   resources :reviews, only: %i[destroy]
   resources :hires, only: %i[destroy]

  #resources :users do
    #resources :artists, only: %i[new create edit update]
    #resources :customers, only: %i[new create show edit update]
  #end
  
  #resources :users do
    #resources :artists, shallow: true
  #end

  #resources :artists do
    #resources :hires, shallow: true
  #end

  # resources :studios do
  #   resources :rooms, shallow: true
  # end
  # resources :rooms do
  #   resources :bookings, shallow: true
 
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
