# frozen_string_literal: true

class CreateDeployments < ActiveRecord::Migration[6.0]
  def change
    create_table :deployments do |t|
      t.text :comments
      t.decimal :microphone_height_off_ground, precision: 5, scale: 2, default: 3.0
      t.string :microphone_orientation, default: ''
      t.integer :sampling_frequency, default: 500
      t.string :pre_trigger, default: 'OFF'
      t.string :recording_length, default: '5'
      t.string :hp_filter, default: 'NO'
      t.string :auto_record, default: 'YES'
      t.string :trigger_sensitivity, default: 'MED'
      t.integer :input_gain, default: 45
      t.string :trigger_level, default: '160' # defaulting this to D500X
      t.integer :interval, default: 0
      t.integer :gain, default: 12
      t.string :sixteen_thousand_high_filter, default: 'OFF'
      t.integer :sample_rate, default: 384
      t.string :min_duration, default: '1.5'
      t.string :max_duration, default: 'none'
      t.integer :min_trigger_frequency, default: 7
      t.integer :trigger_window, default: 3
      t.string :max_length, default: '00:05'
      t.string :compression, default: 'none'

      t.datetime :deployment_date
      t.datetime :recovery_date
      t.datetime :recording_start
      t.datetime :recording_stop

      # Adding both contact references here since it's being manually done
      t.references :primary_contact, foreign_key: { to_table: 'contacts' }
      t.references :recovery_contact, foreign_key: { to_table: 'contacts' }
    end
  end
end
