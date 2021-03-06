# frozen_string_literal: true

FactoryBot.define do
  factory :detector_location do
    sample_unit
    local_habitat
    detection_target
    target_descriptor

    quad_id { 'NW' }
    quad_no { 1 }
    location_identifier { 'FAKE LOCATION IDENTIFIER' }
    location_name { 'FAKE NAME' }
    latitude { 42.42 }
    longitude { 42.42 }
    elevation { 42.42 }
    driving_directions { 'FAKE DRIVING DIRECTIONS' }
  end
end
