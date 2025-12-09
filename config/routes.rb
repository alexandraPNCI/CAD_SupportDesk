Rails.application.routes.draw do
  devise_for :users

  # Authentication-based root routing (Rails 8 compatible)
  authenticated :user do
    root "tickets#index", as: :authenticated_root
  end

  unauthenticated do
    root "devise/sessions#new", as: :unauthenticated_root
  end

  resources :tickets do
    resources :comments, only: [:create]
  end
end
