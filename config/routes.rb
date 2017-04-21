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

  #listing routes
  resources :listings do
    resources :customer_reviews, only: [:create]
  end

  resources :customer_reviews, only: [:update]

  namespace :admin do
    resources :outlets, except: :show do
      resources :listings, only: [:new, :create, :index]
    end
    resources :listings, only: [:delete, :edit, :update] do
      resources :booking_items
      resources :purchase_items
      resources :subscribe_items
    end
  end

  # post "/listings/:listing_id/customer_reviews", to: "customer_reviews#create", as: "listing_customer_reviews"
  # patch "/customer_reviews/:id", to: "customer_reviews#update", as: "edit_customer_review"

end
