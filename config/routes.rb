Rails.application.routes.draw do
  devise_for :users

  # Redirect root depending on authentication status
  authenticated :user, ->(u) { u.present? } do
    root "tickets#index", as: :authenticated_root
  end

  unauthenticated do
    root "devise/sessions#new", as: :unauthenticated_root
  end

  resources :tickets do
    resources :comments, only: [:create]
  end
end

