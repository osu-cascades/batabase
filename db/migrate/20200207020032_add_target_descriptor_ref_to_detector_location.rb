# frozen_string_literal: true

class AddTargetDescriptorRefToDetectorLocation < ActiveRecord::Migration[6.0]
  def change
    add_reference :detector_locations, :target_descriptor, null: false, foreign_key: true
  end
end
