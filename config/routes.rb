# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user

  root to: redirect(path: '/home', status: 302)

  resources :home, only: [:index]
  resources :detectors

  resources :uploads do
    post :commit
  end

  
  resources :contacts
  resources :deployments
end
