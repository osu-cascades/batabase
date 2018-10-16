Rails.application.routes.draw do
  get '/', :to => redirect('/prototype/sign-up.html')
end
