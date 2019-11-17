FactoryBot.define do
  factory :upload do
    data { 'FAKE DATA' }
    sequence(:filename) { |i| "FAKE_FILENAME_#{i}.csv" }
    
    trait :meta do
      upload_type { 'meta' }
    end

    trait :sono do
      upload_type { 'sono' }
    end
  end
end