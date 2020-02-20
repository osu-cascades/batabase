# frozen_string_literal: true

FactoryBot.define do
  factory :software do
    name { 'Sonobat 4' }
    version { 'FAKE VERSION' }
    classifier_package { 'FAKE CLASSIFIER PACKAGE' }
    acceptable_call_quality { 0.8 }
    sequence_decision_threshold { 0.9 }
    max_no_calls { 16 }
    log_file_notes { 'FAKE LOGFILE NOTES' }
    other_settings { 'FAKE OTHER SETTINGS' }

    contact

    trait :Kaleidoscope do
      name { 'Kaleidoscope' }
    end
  end
end
