# frozen_string_literal: true

FactoryBot.define do
  factory :detector_location do
    sample_unit
    local_habitat

    quad_id { 'NW' }
    quad_no { 1 }
    location_identifier { 'FAKE LOCATION IDENTIFIER' }
    location_name { 'FAKE NAME' }
    latitude { 42.42 }
    longitude { 42.42 }
    elevation { 42.42 }
    driving_directions { 'FAKE DRIVING DIRECTIONS' }

    trait :has_detection_targets do
      detection_targets { FactoryBot.build_list(:detection_target, 3) }
    end
  end
end
