# frozen_string_literal: true

class CreateDetector < ActiveRecord::Migration[6.0]
  def change
    create_table :detectors do |t|
      t.string :firmware
      t.string :manufacturer
      t.string :model
      t.string :serial_number
    end
  end
end
