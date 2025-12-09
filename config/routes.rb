Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root "tickets#index", as: :authenticated_root
  end

  devise_scope :user do
    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end

  resources :tickets do
    resources :comments, only: [:create]
  end
end

