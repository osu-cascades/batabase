# frozen_string_literal: true

FactoryBot.define do
  factory :sample_unit_county do
    sample_unit
    county

    percentage { 42.42 }
  end
end
