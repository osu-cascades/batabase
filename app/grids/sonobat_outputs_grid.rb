# frozen_string_literal: true

class SonobatOutputsGrid
  include Datagrid

  scope do
    SonobatOutput
  end

  filter(:night, :default)
  filter(:filename, :default)
  filter(:hi_f, :default)
  filter(:lo_f, :default)
  filter(:spp_accp, :default)
  filter(:prob, :default)
  filter(:maj, :default)
  filter(:accp, :default)
  filter(:spp, :default)
  filter(:tilde_prob, :default)
  filter(:fc_mean, :default)
  filter(:fc_std_dev, :default)
  filter(:dur_mean, :default)
  filter(:dur_std_dev, :default)
  filter(:calls_per_sec, :default)
  filter(:mean_hi_freq, :default)
  filter(:mean_lo_freq, :default)
  filter(:mean_uppr_slp, :default)
  filter(:mean_lwr_slp, :default)
  filter(:mean_total_slp, :default)
  filter(:mean_preceding_intvl, :default)
  filter(:first, :default)
  filter(:second, :default)
  filter(:third, :default)
  filter(:fourth, :default)
  filter(:parent_dir, :default)
  filter(:next_dir_up, :default)
  filter(:file_length, :default)
  filter(:version, :default)
  filter(:filter, :default)
  filter(:accp_quality, :default)
  filter(:accp_qual_for_tally, :default)
  filter(:max_calls_considered, :default)
  filter(:manual_idspp1, :default)
  filter(:manual_idspp2, :default)
  filter(:notes, :default)

  column(:night)
  column(:filename)
  column(:hi_f)
  column(:lo_f)
  column(:spp_accp)
  column(:prob)
  column(:maj)
  column(:accp)
  column(:spp)
  column(:tilde_prob)
  column(:fc_mean)
  column(:fc_std_dev)
  column(:dur_mean)
  column(:dur_std_dev)
  column(:calls_per_sec)
  column(:mean_hi_freq)
  column(:mean_lo_freq)
  column(:mean_uppr_slp)
  column(:mean_lwr_slp)
  column(:mean_total_slp)
  column(:mean_preceding_intvl)
  column(:first)
  column(:second)
  column(:third)
  column(:fourth)
  column(:parent_dir)
  column(:next_dir_up)
  column(:file_length)
  column(:version)
  column(:filter)
  column(:accp_quality)
  column(:accp_qual_for_tally)
  column(:max_calls_considered)
  column(:manual_idspp1)
  column(:manual_idspp2)
  column(:notes)

  column(:edit, html: true, header: '') do |sonobat_output|
    link_to 'Edit', edit_sonobat_output_path(sonobat_output), class: 'btn btn-primary'
  end

  column(:delete, html: true, header: '') do |sonobat_output|
    link_to 'Delete', sonobat_output, method: 'delete', class: 'btn btn-danger', data: { confirm: 'Are you sure?', disable_with: 'Deleting....' }
  end
end
