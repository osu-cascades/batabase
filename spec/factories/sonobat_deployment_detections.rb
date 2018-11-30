FactoryBot.define do
  factory :sonobat_deployment_detection do
    deployment_id { 1 }
    night { Faker::Time }
    path { 'Example Path' }
    hi_f { 1.1 }
    lo_f { 1.1 }
    spp_accp { 'Example SPP ACCP'}
    prob { 1.1 }
    maj { 1.1 }
    accp { 1.1 }
    spp { 'Example SPP' }
    tilde_prob { 'Example Tilde Prob' }
    fc_mean { 1.1 }
    fc_std_dev { 1.1 }
    dur_mean { 1.1 }
    dur_std_dev { 1.1 }
    calls_per_sec { 1.1 }
    mean_hi_freq { 1.1 }
    mean_lo_freq { 1.1 }
    mean_uppr_slp { 1.1 }
    mean_lwr_slp { 1.1 }
    mean_total_slp { 1.1 }
    mean_preceding_intvl { 1.1 }
    first { 'Example First' }
    second { 'Example Second' }
    third { 'Example Third' }
    fourth { 'Example Fourth' }
    parent_dir { 'Example Parent Dir' }
    next_dir_up { 'Example Next Dir Up' }
    file_length { 1.1 }
    version { 1.1 }
    filter { 'Example Filter' }
    accp_quality { 1.1 }
    accp_qual_for_tally { 1.1 }
    max_calls_considered { 1.1 }
    manual_idspp1 { 'Example Manual IDSPP1' }
    manual_idspp2 { 'Example Manual IDSPP2' }
    notes { 'Example Notes' }
  end
end
