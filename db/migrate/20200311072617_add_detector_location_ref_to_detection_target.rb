class AddDetectorLocationRefToDetectionTarget < ActiveRecord::Migration[6.0]
  def change
    add_reference :detection_targets, :detector_location, foreign_key: true
  end
end
