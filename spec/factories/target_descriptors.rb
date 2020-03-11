# frozen_string_literal: true

FactoryBot.define do
  factory :target_descriptor do
    detection_target
    label { 'FAKE LABEL' }
  end
end
