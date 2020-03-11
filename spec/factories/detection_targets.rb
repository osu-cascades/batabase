# frozen_string_literal: true

FactoryBot.define do
  factory :detection_target do
    detector_location
    label { 'FAKE LABEL' }

    trait :has_target_descriptors do
      target_descriptors { FactoryBot.build_list(:target_descriptor, 5) }
    end
  end
end
