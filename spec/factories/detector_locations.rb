FactoryBot.define do
  factory :detector_location do
    sample_unit
    location_name { '123456_NE2' }
    latitude { 44.4444444}
    longitude { -121.121121 }
    elevation { 3000 }
    land_ownership { 'Example Ownership' }
  end
end
