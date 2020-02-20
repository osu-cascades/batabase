# frozen_string_literal: true

class CreateDetectorLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :detector_locations do |t|
      t.string :quad_id
      t.integer :quad_no
      t.string :location_identifier
      t.string :location_name
      t.float :latitude
      t.float :longitude
      t.float :elevation
      t.string :driving_directions
      t.string :land_ownership
    end
  end
end
