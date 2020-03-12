class RemoveJointTableDetectorLocationDetectionTarget < ActiveRecord::Migration[6.0]
  def change
    drop_table :detection_targets_detector_locations
  end
end
