FactoryBot.define do
  factory :detector do
    code { 'ODFW-12345' }
    serial_num  { 'abcdefg1234567' }
    manufacturer { 'Petterson' }
    firmware { '2.2.8' }
    created_by { 'TODO - Need to set up user model' }
    last_modified_by { 'TODO - Need to set up user model' }
  end
end
