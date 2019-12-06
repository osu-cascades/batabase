FactoryBot.define do
  factory :detector do
    organization
    manufacturer { "FAKE MANUFACTURER" }
    model { "FAKE MODEL" }
    serial_number { "FAKE SERIAL NUMBER" }
  end
end