FactoryBot.define do
  factory :deployment_software do
    deployment_id { 1 }
    software_id { 1 }
    contact_id { 1 }
    version { 'Example Version' }
    classifier_package { 'Example Classifier Package' }
    other_settings { 'Example other settings' }
  end
end
