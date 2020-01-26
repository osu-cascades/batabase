# frozen_string_literal: true

class AddOrganizationRefToDetectors < ActiveRecord::Migration[6.0]
  def change
    add_reference :detectors, :organization, null: false, foreign_key: true
  end
end
