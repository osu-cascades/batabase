# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    state
    last_name { 'FAKE LAST NAME' }
    first_name { 'FAKE FIRST NAME' }
    notes { 'FAKE NOTES' }

    trait :has_organization do
      organization
    end

    trait :has_software do
      softwares { FactoryBot.build_list(:software, 5) }
    end
  end
end
