Rails.application.routes.draw do
  root to: redirect(path: '/uploads', status: 302)

  resources :uploads
end
