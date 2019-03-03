class AddDetectionTargetToDetectorLocation < ActiveRecord::Migration[5.2]
  def change
    add_reference :detector_locations, :detection_target, foreign_key: true
  end
end
