FactoryBot.define do
  factory :detector_location do
    sample_unit
    location_name { 'Example Location Name' }
    latitude { 44.4444444}
    longitude { -121.121121 }
    elevation { 3000 }
    land_ownership { 'Example Ownership' }
  end
end
