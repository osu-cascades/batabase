Rails.application.routes.draw do
  root to: 'static#home'

  devise_for :users

  namespace :list_maintenance do
    resources :broad_habitats, only: [:index]
  end
end
