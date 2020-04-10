# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user

  root to: redirect(path: '/home', status: 302)

  resources :home, only: [:index]
  resources :uploads do
    get :commit
  end

  resources :detectors, only: [:index]
  resources :contacts, only: [:index]
  resources :deployments, only: [:index]
end
