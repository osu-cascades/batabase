FactoryBot.define do
  factory :upload do
    filename { 'FAKE_FILENAME.csv' }

    data { 'FAKE DATA' }
    
    trait :meta do
      upload_type { 'meta' }
    end

    trait :sono do
      upload_type { 'sono' }
    end
  end
end