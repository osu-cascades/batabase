class CreateDetectionTarget < ActiveRecord::Migration[6.0]
  def change
    create_table :detection_targets do |t|
      t.string :label
    end
  end
end
