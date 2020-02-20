# frozen_string_literal: true

FactoryBot.define do
  factory :broad_habitat do
    name { 'FAKE NAME' }

    trait :has_broad_habitat_forms do
      broad_habitat_forms { FactoryBot.build_list(:broad_habitat_form, 5) }
    end

    trait :has_sample_units do
      sample_units { FactoryBot.build_list(:sample_unit, 5) }
    end
  end
end
