class RemoveDetectorLocationIdFromDetectionTarget < ActiveRecord::Migration[6.0]
  def change
    remove_column :detection_targets, :detector_location_id
  end
end
