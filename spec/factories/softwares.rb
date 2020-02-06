# frozen_string_literal: true

FactoryBot.define do
  factory :software do
    trait :sonobat do
      name { 'Sonobat 4' }
    end

    trait :Kaleidoscope do
      name { 'Kaleidoscope' }
    end
  end
end
