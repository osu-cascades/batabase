class CreateTargetDescriptors < ActiveRecord::Migration[5.2]
  def change
    create_table :target_descriptors do |t|
      t.string :label
      t.belongs_to :detection_target, index: true

      t.timestamps
    end
  end
end
