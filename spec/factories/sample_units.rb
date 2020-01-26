# frozen_string_literal: true

FactoryBot.define do
  factory :sample_unit do
    agency { 'FAKE AGENCY' }
    grts { 42 }

    trait :has_multiple_sample_unit_states do
      # TODO: Make this better
      sample_unit_states do
        Array.new(3) do |i|
          SampleUnitState.new(
            percentage: i * 0.1,
            state_id: 1
          )
        end
      end
    end

    trait :has_multiple_sample_unit_counties do
      # TODO: Make this better
      sample_unit_counties do
        Array.new(3) do |i|
          SampleUnitCounty.new(
            percentage: i * 0.1,
            county_id: 1
          )
        end
      end
    end

    trait :has_broad_habitat_information do
      broad_habitat
      broad_habitat_form
    end
  end
end
