Rails.application.routes.draw do

  resources :meals, only: [:index, :show, :update, :create, :destroy]
  resources :users, only: [:index, :show, :update, :create, :destroy]
  resources :orders, only: [:index, :show, :update, :create, :destroy]
  resources :order_meals, only: [:index, :show, :update, :create, :destroy]

  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

end
