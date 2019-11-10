FactoryBot.define do
  factory :upload do
    data { 'FAKE DATA' }
  end

  trait :empty_upload do
    data { '' }
  end
end