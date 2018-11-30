class CreateDetectionTargets < ActiveRecord::Migration[5.2]
  def change
    create_table :detection_targets do |t|
      t.string :label

      t.timestamps
    end
  end
end
