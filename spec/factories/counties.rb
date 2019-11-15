FactoryBot.define do
  state

  factory :county do
    name { 'FAKE NAME' }
    state_id { state.id }
  end
end