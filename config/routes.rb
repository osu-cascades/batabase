Rails.application.routes.draw do
  root to: 'static#home'

  devise_for :users

  namespace :list_maintenance, as: '' do
    resources :broad_habitats, except: [:show]
  end
end
