# frozen_string_literal: true

Rails.application.routes.draw do
  resources :flexible_searches
  resources :location_mappings
  devise_for :user

  root to: redirect(path: '/home', status: 302)

  resources :home, only: [:index]

  resources :detectors do
    collection do
      get 'export'
    end
  end

  resources :uploads do
    post :commit
  end

  resources :contacts do
    collection do
      get 'export'
    end
  end

  resources :deployments do
    collection do
      get 'export'
    end
  end

  resources :sonobat_outputs do
    collection do
      get 'export'
    end
  end

  get '/sonobat_outputs', to: 'sonobat_outputs#show', as: 'sbshow'
  
end
