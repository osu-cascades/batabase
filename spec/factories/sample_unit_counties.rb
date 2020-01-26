# frozen_string_literal: true

FactoryBot.define do
  factory :sample_unit_county do
    sample_unit { FactoryBot.build_stubbed(:sample_unit) }
    county { FactoryBot.build_stubbed(:county) }

    percentage { 42.42 }
  end
end
