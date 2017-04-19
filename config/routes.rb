Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  #user crud
  get 'signup', to: 'users#new', as: 'signup'
  resources :users, except: :new

  #admin crud
  resources :admins

  #user & admin authentication
  namespace :auth do
    resources :admins, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create, :destroy]
    get "/:provider/callback", to: "users#create_facebook_omniauth", as: "external"

  end

  get 'logout', to: 'sessions#destroy', as: 'logout'

end
