FactoryBot.define do
  factory :deployment_software do
    deployment_id { 1 }
    software_id { 1 }
    contact_id { 1 }
    version { 'Example Version' }
    classifier_package { 'Example Classifier Package' }
    other_settings { 'Example other settings' }
    created_by { 'TODO' }
    last_modified_by { 'TODO' }
  end
end
