class RemoveDetectorLocationFromTargetDescriptor < ActiveRecord::Migration[6.0]
  def change
    remove_column :detector_locations, :target_descriptor_id
  end
end
