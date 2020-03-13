# frozen_string_literal: true

FactoryBot.define do
  factory :detection_target do
    label { 'FAKE LABEL' }

    trait :has_target_descriptors do
      target_descriptors { FactoryBot.build_list(:target_descriptor, 5) }
    end

    trait :has_detector_locations do
      detector_locations { FactoryBot.build_list(:detector_location, 5) }
    end
  end
end
