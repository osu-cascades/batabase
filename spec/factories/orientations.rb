# frozen_string_literal: true

FactoryBot.define do
  factory :orientation do
    trait :north do
      direction { 'N' }
    end

    trait :west do
      direction { 'W' }
    end

    trait :east do
      direction { 'E' }
    end

    trait :south do
      direction { 'S' }
    end

    trait :northwest do
      direction { 'NW' }
    end

    trait :northeast do
      direction { 'NE' }
    end

    trait :southwest do
      direction { 'SW' }
    end

    trait :southeast do
      direction { 'SE' }
    end
  end
end
