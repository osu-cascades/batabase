# frozen_string_literal: true

class CreateSonobatOutputs < ActiveRecord::Migration[6.0]
  def change
    create_table :sonobat_outputs do |t|
      t.string :detector_location
      t.datetime :night
      t.string :filename
      t.boolean :hi_f
      t.boolean :lo_f
      t.string :spp_accp
      t.float :prob
      t.float :maj
      t.float :accp
      t.string :spp
      t.string :tilde_prob
      t.float :fc_mean
      t.float :fc_std_dev
      t.float :dur_mean
      t.float :dur_std_dev
      t.string :calls_per_sec
      t.float :mean_hi_freq
      t.float :mean_lo_freq
      t.float :mean_uppr_slp
      t.float :mean_lwr_slp
      t.float :mean_total_slp
      t.float :mean_preceding_intvl
      t.string :first
      t.string :second
      t.string :third
      t.string :fourth
      t.string :parent_dir
      t.string :next_dir_up
      t.float :file_length
      t.float :version
      t.string :filter
      t.float :accp_quality
      t.float :accp_qual_for_tally
      t.float :max_calls_considered
      t.string :manual_idspp1
      t.string :manual_idspp2
      t.string :notes

      t.belongs_to :deployment, foreign_key: true
    end
  end
end
