# frozen_string_literal: true

FactoryBot.define do
  factory :detector do
    organization
    firmware { 'FAKE FIRMWARE' }
    manufacturer { 'FAKE MANUFACTURER' }
    model { 'FAKE MODEL' }
    serial_number { 'FAKE SERIAL NUMBER' }
  end
end
