User.create!(
  email: 'nathanstruhs@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  confirmed_at: Time.now.utc,
  role: :admin
)

User.create!(
  email: 'drudged@oregonstate.edu',
  password: 'password',
  password_confirmation: 'password',
  confirmed_at: Time.now.utc,
  role: :admin
)

User.create!(
  email: 'guest@guest.com',
  password: 'password',
  password_confirmation: 'password',
  confirmed_at: Time.now.utc,
  role: :guest
)

User.create!(
  email: 'field-agent@field-agent.com',
  password: 'password',
  password_confirmation: 'password',
  confirmed_at: Time.now.utc,
  role: :field_agent
)

User.create!(
  email: 'admin@admin.com',
  password: 'password',
  password_confirmation: 'password',
  confirmed_at: Time.now.utc,
  role: :admin
)
