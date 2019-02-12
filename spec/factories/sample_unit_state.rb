FactoryBot.define do
  factory :sample_unit_state do
    sample_unit
    state
    percentage { 50.0 }
  end
end
