# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    state
    last_name { 'FAKE LAST NAME' }
    first_name { 'FAKE FIRST NAME' }
    notes { 'FAKE NOTES' }

    trait :has_organization do
      organization
    end

    trait :has_software do
      softwares do
        Array.new(5) do |i|
          Software.new(
            version: "FAKE VERSION #{i.humanize.upcase}",
            classifier_package: 'FAKE CLASSIFIER PACKAGE',
            log_file_notes: 'FAKE LOGFILE NOTES',
            other_settings: 'FAKE OTHER SETTINGS'
          )
        end
      end
    end
  end
end
