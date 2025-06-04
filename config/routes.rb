Rails.application.routes.draw do
  devise_for :users

  # Booking routes using RESTful resources
  resources :bookings, only: [:index, :new, :create, :edit, :update]

  # Flat routes
  resources :flats, only: [:index, :new, :create, :show, :edit]

  # Custom user routes
  resources :users, only: [:show] do
    member do
      get :dashboard
    end
  end

  # Homepage
  root to: "pages#home"
end
