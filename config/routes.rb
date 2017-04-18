Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get "/auth/:provider/callback", to: "sessions#create_facebook_omniauth"
  get "/auth/failure", to: "sessions#failure"

  resources :users, except: :new
  resources :sessions, only: :create
end
