Rails.application.routes.draw do
  root to: redirect(path: '/home', status: 302)

  resources :home, only: [ :index ]
  resources :uploads
end
