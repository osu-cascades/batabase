class RemoveFieldsFromDetectorLocations < ActiveRecord::Migration[6.0]
  def change
    remove_column :detector_locations, :sample_unit_id, :bigint

    remove_column :detector_locations, :local_habitat_id, :bigint

    remove_column :detector_locations, :detection_target_id, :bigint

    remove_column :detector_locations, :target_descriptor_id, :bigint
  end
end
