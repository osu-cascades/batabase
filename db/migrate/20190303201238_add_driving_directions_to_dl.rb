class AddDrivingDirectionsToDl < ActiveRecord::Migration[5.2]
  def change
    add_column :detector_locations, :driving_directions, :text
  end
end
