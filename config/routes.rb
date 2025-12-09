Rails.application.routes.draw do
  devise_for :users
  resources :tickets do
    resources :comments, only: [:create, :destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check
  root "tickets#index"
end

