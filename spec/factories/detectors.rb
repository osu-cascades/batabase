FactoryBot.define do
  factory :detector do
    manufacturer { "FAKE MANUFACTURER" }
    model { "FAKE MODEL" }
    serial_number { "FAKE SERIAL NUMBER" }

    trait :odfw do
      owner { 'ODFW' }
    end

    trait :npw do
      owner { 'NPS' }
    end

    trait :blm do
      owner { 'BLM' }
    end

    trait :usfs do
      owner { 'USFS' }
    end

    trait :osu do
      owner { 'OSU' }
    end

    trait :other do
      owner { 'Other' }
    end
  end
end