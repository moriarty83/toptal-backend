Rails.application.routes.draw do
  resources :foods
  resources :food_entries
  resource :users, only: [:create]

  get "/admin", to: "foods#admin"
  post "/admin", to: "foods#new"
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
