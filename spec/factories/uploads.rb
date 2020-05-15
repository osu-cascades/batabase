# frozen_string_literal: true

FactoryBot.define do
  factory :upload do
    data { 'FAKE DATA' }
    sequence(:filename) { |i| "FAKE_FILENAME_#{i}.csv" }
    upload_type { 'Site Metadata' }

    trait :sono do
      upload_type { 'Sonobat Output' }
    end
  end
end
