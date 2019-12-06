class CreateDetector < ActiveRecord::Migration[6.0]
  def change
    create_table :detectors do |t|
      t.string :owner
      t.string :serial_number
      t.string :model
      t.string :manufacturer
    end
  end
end
