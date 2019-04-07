class AddLandOwnershipDetailsToDetectorLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :detector_locations, :land_ownership_detail, :text
  end
end
