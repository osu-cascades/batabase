FactoryBot.define do
  factory :deployment do
    point_location_id { 1 }
    detector_id { 1 }
    deployment_date { Faker::Date }
    recovery_date { Faker::Date }
    contact_id { 1 }
    species_group_id { 1 }
    notes { 'Example Notes' }
    distance_range_id { 1 }
    microphone_type_id { 1 }
    microphone_height_off_ground { '33 mm' }
    microphone_orientation_id { 1 }
    clutter_type_id { 1 }
    clutter_percent { 50 }
  end
end
