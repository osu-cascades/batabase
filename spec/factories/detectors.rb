# frozen_string_literal: true

FactoryBot.define do
  factory :detector do
    organization
    manufacturer { 'FAKE MANUFACTURER' }
    model { 'FAKE MODEL' }
    serial_number { 'FAKE SERIAL NUMBER' }
  end
end
