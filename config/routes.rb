Rails.application.routes.draw do
  root to: 'static#home'

  devise_for :users

  namespace :list_maintenance, as: '' do
    resources :broad_habitats, except: [:show]
    resources :contacts, except: [:show]
    resources :organizations, except: [:show]
  end
end
