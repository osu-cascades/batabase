FactoryBot.define do
  factory :kaleidoscope_deployment_detection do
    deployment_id  { 1 }
    night { Faker::Time }
    folder { 'Example Folder' }
    in_file { 'Example File' }
    channel { 1.1 }
    offset { 1.1 }
    duration { 1.1 }
    out_file { 'Example Out File' }
    detection_date { Faker::Date }
    detection_time { Faker::Time  }
    detection_hour { 1 }
    detection_date12 { Faker::Date }
    detection_time12 { Faker::Time  }
    detection_hour12 { Faker::Time  }
    auto_id { 1 }
    pulses { 1.1 }
    matching { 1.1 }
    margin { 1.1 }
    alternates { 'Example Alternate' }
    n { 1.1 }
    fc { 1.1 }
    sc { 1.1 }
    dur { 1.1 }
    f_max { 1.1 }
    f_min { 1.1 }
    f_mean { 1.1 }
    tbc { 'Example TCB' }
    fk { 'Example FK' }
    tk { 1.1 }
    s1 { 'Example S1' }
    tc { 'Example TC' }
    qual { 1.1 }
    files { 1.1 }
    manual_idspp1 { 'Example Manual IDSPP1' }
    manual_idspp2 { 'Example Manual IDSPP2' }
    notes { 'Example Notes' }
    created_by { 'TODO' }
    last_modified_by { 'TODO' }
  end
end
