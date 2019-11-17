FactoryBot.define do
  factory :upload do
    data { 'FAKE DATA' }
    filename { 'FAKE_FILENAME.FAKE' }
    
    trait :meta do
      upload_type { 'meta' }
    end

    trait :sono do
      upload_type { 'sono' }
    end
  end
end