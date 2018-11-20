User.create!(
  :email => 'nathanstruhs@gmail.com',
  :password => 'password',
  :password_confirmation => 'password',
  confirmed_at: Time.now.utc
)

User.create!(
  :email => 'drudged@oregonstate.edu',
  :password => 'password',
  :password_confirmation => 'password',
  confirmed_at: Time.now.utc
)
