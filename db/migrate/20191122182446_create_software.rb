# frozen_string_literal: true

class CreateSoftware < ActiveRecord::Migration[6.0]
  def change
    create_table :softwares do |t|
      t.string :name
      t.string :version
      t.string :classifier_package
      t.float :acceptable_call_quality
      t.float :sqnc_decision_threshold
      t.integer :max_no_calls
      t.string :log_file_notes
      t.string :other_settings
    end
  end
end
