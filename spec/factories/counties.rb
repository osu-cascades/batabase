FactoryBot.define do
  factory :county do
    state { FactoryBot.build_stubbed(:state) }
    name { 'FAKE NAME' }
    state_id { state.id }
  end
end