FactoryBot.define do
  factory :sample_unit_county do
    sample_unit
    county
    percentage { 50.0 }
  end
end
