class RemoveDetectorLocationFromDetectionTarget < ActiveRecord::Migration[6.0]
  def change
    remove_column :detector_locations, :detection_target_id
  end
end
