# frozen_string_literal: true

FactoryBot.define do
  factory :sonobat_output do
    deployment

    night { Time.now }
    filename { 'FAKE FILENAME' }
    hi_f { false }
    lo_f { false }
    spp_accp { 'FAKE SPP ACCP' }
    prob { 4.2 }
    maj { 4.2 }
    accp { 4.2 }
    spp { 'FAKE SPP' }
    tilde_prob { 'FAKE TILDE PROB' }
    fc_mean { 4.2 }
    fc_std_dev { 4.2 }
    dur_mean { 4.2 }
    dur_std_dev { 4.2 }
    calls_per_sec { 'FAKE CALLS PER SEC' }
    mean_hi_freq { 4.2 }
    mean_lo_freq { 4.2 }
    mean_uppr_slp { 4.2 }
    mean_lwr_slp { 4.2 }
    mean_total_slp { 4.2 }
    mean_preceding_intvl { 4.2 }
    first { 'FAKE FIRST' }
    second { 'FAKE SECOND' }
    third { 'FAKE THIRD' }
    fourth { 'FAKE FOURTH' }
    parent_dir { 'FAKE PARENT DIR' }
    next_dir_up { 'FAKE NEXT DIR UP' }
    file_length { 4.2 }
    version { 4.2 }
    filter { 'FAKE FILTER' }
    accp_quality { 4.2 }
    accp_qual_for_tally { 4.2 }
    max_calls_considered { 4.2 }
    manual_idspp1 { 'FAKE MANUAL IDSPP 1' }
    manual_idspp2 { 'FAKE MANUAL IDSPP 2' }
    notes { 'FAKE NOTES' }
  end
end
