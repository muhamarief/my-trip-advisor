Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  #user crud
  get 'signup', to: 'users#new', as: 'signup'
  resources :users, except: :new

  #admin crud
  # resources :admins

  #user & admin authentication
  namespace :auth do
    resources :admins, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create, :destroy]
    get "/:provider/callback", to: "users#create_facebook_omniauth", as: "external"

  end
  # get 'login', to: 'sessions#new_user', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  # get "/auth/:provider/callback", to: "auth/users#create_facebook_omniauth"
  # get "/auth/failure", to: "auth/users#failure"


  # get '/admin/login', to: 'sessions#new_admin', as: 'admin_session'
  # post '/sessions', to: "sessions#create_admin", as: 'admin_session_login'
  # resources :admins, :only => [:create, :destroy]



  # resources :sessions, only: :create

end
