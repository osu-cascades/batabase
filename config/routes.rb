Rails.application.routes.draw do
  root to: redirect(path: '/uploads/new', status: 302)

  resources :uploads
end
