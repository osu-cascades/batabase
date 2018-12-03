class AddOrganizationAssocationToDetector < ActiveRecord::Migration[5.2]
  def change
    add_reference :detectors, :organization, index: true
  end
end
