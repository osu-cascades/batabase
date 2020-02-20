# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    name { 'FAKE NAME' }

    trait :has_detectors do
      detectors { FactoryBot.build_list(:detector, 5) }
    end

    trait :has_contacts do
      contacts { FactoryBot.build_list(:contact, 5) }
    end
  end
end
