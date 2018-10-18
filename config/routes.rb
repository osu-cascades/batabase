Rails.application.routes.draw do
  get '/', to: redirect('/prototype/user/sign-in.html')
end
