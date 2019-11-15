FactoryBot.define do
  factory :county do
    state
    name { 'FAKE NAME' }
    state_id { state.id }
  end
end