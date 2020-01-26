# frozen_string_literal: true

FactoryBot.define do
  factory :state do
    name { 'FAKE NAME' }
    abbreviation { 'FAKE ABBREVIATION' }

    trait :has_counties do
      counties do
        Array.new(5) do |i|
          County.new(
            name: "FAKE NAME #{i.humanize.upcase}"
          )
        end
      end
    end
  end
end
