FactoryBot.define do
  factory :sample_unit do
    agency { 'FAKE AGENCY' }
    grts { 42 }

    trait :has_broad_habitat_information do
      broad_habitat
      broad_habitat_form
    end
  end
end