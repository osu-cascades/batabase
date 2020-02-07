class AddLandOwnershipToDetectorLocation < ActiveRecord::Migration[6.0]
  def change
    add_column :detector_locations, :land_ownership, :string
  end
end
