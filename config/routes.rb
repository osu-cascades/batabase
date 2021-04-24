# frozen_string_literal: true

Rails.application.routes.draw do
  resources :flexible_searches  
  resources :location_mappings
  resources :ransack_queries
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
  resources :sonobat_outputs

  get '/flexible_searches', to: 'flexible_searches#index', as: 'flexible_search_old'
  get '/flexible_searches/results', to: 'flexible_searches#results', as: 'flexible_search_results'
  get "events/:id/edit" => "events#edit", as: "edit_flexi_search"

end
