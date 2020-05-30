  Rails.application.routes.draw do
  get 'home/index'
  resources :admin_users

  root 'home#index'
  # root to: "admin_users#index"
end
