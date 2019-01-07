FactoryBot.define do
  factory :detection_target do
    label { 'Example Detection Target' }

    factory :detection_target_with_target_descriptor do
      after(:create) do |detection_target|
        create(:target_descriptor, detection_target: detection_target)
      end
    end
  end
end
