# frozen_string_literal: true

FactoryBot.define do
  factory :state do
    name { 'FAKE NAME' }
    abbreviation { 'FAKE ABBREVIATION' }

    trait :has_contacts do
      contacts { FactoryBot.build_list(:contact, 5) }
    end

    trait :has_counties do
      counties { FactoryBot.build_list(:county, 5) }
    end

    trait :has_sample_units do
      sample_units { FactoryBot.build_list(:sample_unit, 5) }
    end
  end
end
