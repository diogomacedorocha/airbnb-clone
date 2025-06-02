Rails.application.routes.draw do
  root to: "pages#home"

  resources :flats, only: [:index, :new, :create]

  get "up" => "rails/health#show", as: :rails_health_check

  # root "posts#index"
end
