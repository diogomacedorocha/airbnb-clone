Rails.application.routes.draw do
  devise_for :users

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
