class CreateJoinTableDetectorLocationDetectionTarget < ActiveRecord::Migration[6.0]
  def change
    create_join_table :detector_locations, :detection_targets do |t|
      t.index [:detector_location_id, :detection_target_id], :name => 'detector_loc_target_index'
      t.index [:detection_target_id, :detector_location_id], :name => 'detection_detector_loc_index'
    end
  end
end
