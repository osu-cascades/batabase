FactoryBot.define do
  factory :detector do
    serial_num  { 'abcdefg1234567' }
    manufacturer { 'Petterson' }
    firmware { '2.2.8' }
  end
end
