class CreateRecordingLength < ActiveRecord::Migration[6.0]
  def change
    create_table :recording_lengths do |t|
      t.float :length, precision: 5, scale: 1
    end
  end
end
