# frozen_string_literal: true

FactoryBot.define do
  factory :county do
    state

    name { 'FAKE NAME' }

    trait :has_sample_units do
      sample_units { FactoryBot.build_list(:sample_unit, 5) }
    end
  end
end
