# frozen_string_literal: true

FactoryBot.define do
  factory :local_habitat do
    trait :mixed_conifer do
      label { 'mixed conifer' }
    end

    trait :dry_conifer do
      label { 'dry conifer' }
    end

    trait :hardwood do
      label { 'hardwood' }
    end

    trait :alpine_forest do
      label { 'alpine forest' }
    end

    trait :mesic_forest do
      label { 'mesic forest' }
    end

    trait :urban do
      label { 'urban' }
    end

    trait :agriculture do
      label { 'agriculture' }
    end

    trait :grassland do
      label { 'grassland' }
    end

    trait :shrub_steppe do
      label { 'shrub-steppe' }
    end

    trait :has_detector_locations do
      detector_locations { FactoryBot.build_list(:detector_location, 5) }
    end
  end
end
