authenticated :user do
  root to: "tickets#index", as: :authenticated_root
end

unauthenticated do
  root to: "devise/sessions#new", as: :unauthenticated_root
end
