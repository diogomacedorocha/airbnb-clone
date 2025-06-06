Rails.application.routes.draw do
  devise_for :users

  # Booking routes using RESTful resources
  resources :bookings, only: [:index, :new, :create, :edit, :update]

  # Flat routes
  resources :flats, only: [:index, :new, :create, :edit, :update]

  # Custom route for host-side view of booking requests
  get 'bookings/requests', to: 'bookings#requests', as: 'booking_requests'

  get "properties", to: "flats#properties", as: :properties # This makes /properties available and properties_path usable in views

  # Custom user routes
 resources :users, only: [:show, :edit, :update] do
  member do
    get :dashboard
  end
end

  # Homepage
  root to: "pages#home"
end
