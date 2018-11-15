Rails.application.routes.draw do
  root to: 'static#home'

  devise_for :users

  get 'list_maintenance', to: 'list_maintenance#index'

  namespace :list_maintenance do
    resources :broad_habitats, only: [:index]
  end
end
