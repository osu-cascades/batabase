# frozen_string_literal: true

class AddDeploymentRefs < ActiveRecord::Migration[6.0]
  def change
    add_reference :deployments, :sample_unit, null: false, foreign_key: true
    add_reference :deployments, :detector, null: false, foreign_key: true
    add_reference :deployments, :distance_range, null: true, foreign_key: true
    add_reference :deployments, :clutter_type, null: false, foreign_key: true
  end
end
