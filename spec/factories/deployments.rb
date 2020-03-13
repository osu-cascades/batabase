# frozen_string_literal: true

FactoryBot.define do
  factory :deployment do
    detector_location
    detector
    distance_range
    clutter_type
    clutter_percent

    comments { 'FAKE COMMENTS' }
    microphone_height_off_ground { 42.42 }
    microphone_orientation { 'N' }
    sampling_frequency { 42 }
    pre_trigger { 'FAKE PRE TRIGGER' }
    recording_length { 'FAKE RECORDING LENGTH' }
    hp_filter { 'FAKE HP FILTER' }
    auto_record { 'FAKE AUTO RECORD' }
    trigger_sensitivity { 'FAKE TRIGGER SENSITIVITY' }
    input_gain { 42 }
    trigger_level { 'FAKE TRIGGER LEVEL' }
    interval { 42 }
    gain { 42 }
    sixteen_thousand_high_filter { 'FAKE SIXTEEN THOUSAND HIGH FILTER' }
    sample_rate { 42 }
    min_duration { 'FAKE MIN DURATION' }
    max_duration { 'FAKE MAX DURATION' }
    min_trigger_frequency { 42 }
    trigger_window { 42 }
    max_length {  'FAKE MAX LENGTH' }
    compression { 'FAKE COMPRESSION' }

    deployment_date { 42.years.ago }
    recovery_date { 42.years.ago }
    recording_start { 42.years.ago }
    recording_stop { 42.years.ago }

    association :primary_contact, factory: :contact
    association :recovery_contact, factory: :contact
  end
end
