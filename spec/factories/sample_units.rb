# frozen_string_literal: true

FactoryBot.define do
  factory :sample_unit do
    code { 42 }
    grts { 42 }

    trait :has_sample_unit_states do
      sample_unit_states { FactoryBot.build_list(:sample_unit_state, 5) }
    end

    trait :has_sample_unit_counties do
      sample_unit_counties { FactoryBot.build_list(:sample_unit_county, 5) }
    end

    trait :has_broad_habitat_information do
      broad_habitat
      broad_habitat_form
    end
  end
end
