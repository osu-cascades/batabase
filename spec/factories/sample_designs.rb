FactoryBot.define do
  factory :sample_design do
    sample_design_type
    label { 'Example Label' }
    description { 'Example Description' }
  end
end
