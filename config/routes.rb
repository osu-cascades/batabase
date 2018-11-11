Rails.application.routes.draw do
  devise_for :users
  root to: 'static#home'
  resources :list_maintenances
end
