# frozen_string_literal: true

Rails.application.routes.draw do
  resources :flexible_searches
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
end
