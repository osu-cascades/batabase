# frozen_string_literal: true

FactoryBot.define do
  factory :software do
    trait :sonobat do
      name { 'Sonobat 4' }
    end

    trait :Kaleidoscope do
      name { 'Kaleidoscope' }
    end

    version { '4.0.7/4.1' }
    acceptable_call_quality { 0.80 }
    sequence_decision_threshold { 0.90 }
    max_no_calls { 16 }
    logfile_notes { 'FAKE NOTES ABOUT SOME THINGS' }
    other_settings { 'FAKE OTHER SETTINGS ABOUT SETTINGS' }
  end
end
