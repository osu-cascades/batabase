class CreateDetectorLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :detector_locations do |t|
      t.bigint :sample_unit_id
      t.string :quad_id
      t.integer :quad_no
      t.string :location_id
      t.string :location_name
      t.float :latitude
      t.float :longitude
      t.float :elevation
      t.string :driving_directions
      t.bigint :local_habitat_id
      t.bigint :detection_target_id
      t.bigint :target_descriptor_id

      t.timestamps
    end
  end
end
