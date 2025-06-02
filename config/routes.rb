Rails.application.routes.draw do
  devise_for :users

  # Custom user routes
  resources :users, only: [:show] do
    member do
      get :dashboard
    end
  end

  # Homepage
  root to: "pages#home"

end
