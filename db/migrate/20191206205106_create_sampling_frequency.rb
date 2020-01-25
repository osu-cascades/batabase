# frozen_string_literal: true

class CreateSamplingFrequency < ActiveRecord::Migration[6.0]
  def change
    create_table :sampling_frequencies do |t|
      t.float :frequency, precision: 4, scale: 1
    end
  end
end
