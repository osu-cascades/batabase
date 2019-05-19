class AddDetectorColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :detectors, :sampling_frequency, :integer
    add_column :detectors, :pre_trigger, :string
    add_column :detectors, :recording_length, :float
    add_column :detectors, :hp_filter, :string
    add_column :detectors, :auto_rec, :string
    add_column :detectors, :trigger_sensitivity, :string
    add_column :detectors, :input_gain, :integer
    add_column :detectors, :trigger_level, :integer
    add_column :detectors, :interval, :integer
    add_column :detectors, :recording_start, :datetime
    add_column :detectors, :recording_stop, :datetime
  end
end
