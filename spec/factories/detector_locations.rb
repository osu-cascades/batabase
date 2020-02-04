FactoryBot.define do
  factory :detector_location do
    sample_unit_id { "" }
    quad_id { "MyString" }
    quad_no { 1 }
    location_id { "MyString" }
    location_name { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
    elevation { 1.5 }
    driving_directions { "MyString" }
    local_habitat_id { "" }
    detection_target_id { "" }
    target_descriptor_id { "" }
  end
end
