Rails.application.routes.draw do
  # ------------------------------------------------------------
  # Devise routes for User model
  # ------------------------------------------------------------
  devise_for :users

  # ------------------------------------------------------------
  # Root path for authenticated users
  # ------------------------------------------------------------
  authenticated :user do
    root to: "tickets#index", as: :authenticated_root
  end

  # ------------------------------------------------------------
  # Root path for unauthenticated users
  # ------------------------------------------------------------
  devise_scope :user do
    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end

  # ------------------------------------------------------------
  # Ticket system (includes comment create + destroy routes)
  # ------------------------------------------------------------
  resources :tickets do
    resources :comments, only: [:create, :destroy]
  end
end
