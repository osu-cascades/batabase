class AddGeoDtoDetectorlocations < ActiveRecord::Migration[5.2]
  def change
    add_reference :detector_locations, :geodetic_system, foreign_key: true
  end
end
