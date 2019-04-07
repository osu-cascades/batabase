class AddTargetDescriptortoDetectorlocations < ActiveRecord::Migration[5.2]
  def change
    add_reference :detector_locations, :target_descriptor, foreign_key: true
  end
end
