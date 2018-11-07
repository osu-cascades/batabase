FactoryBot.define do
  factory :species do
    code { '1234abcd' }
    common_name { 'Example Common Name' }
    scientific_name { 'Example Scientific Name' }
    tsn { 1 }
  end
end
