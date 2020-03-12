# frozen_string_literal: true

FactoryBot.define do
  factory :target_descriptor do
    detection_target
    label { 'FAKE LABEL' }

    trait :has_detector_locations do
      detector_locations { FactoryBot.build_list(:detector_location, 3) }
    end
  end
end
