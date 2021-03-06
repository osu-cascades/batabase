# frozen_string_literal: true

class AddDetectionTargetRefToDetectorLocation < ActiveRecord::Migration[6.0]
  def change
    add_reference :detector_locations, :detection_target, null: false, foreign_key: true
  end
end
