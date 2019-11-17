class AddDetectionTargetRefToTargetDescriptors < ActiveRecord::Migration[6.0]
  def change
    add_reference :target_descriptors, :detection_target, null: false, foreign_key: true
  end
end
