FactoryBot.define do
  factory :sample_unit do
    id { 1 }
    site_code { 'Example Site Code' }
    agency { 'Example Federal Agency' }
    broad_habitat_form
  end
end
