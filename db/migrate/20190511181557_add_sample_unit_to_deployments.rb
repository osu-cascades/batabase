class AddSampleUnitToDeployments < ActiveRecord::Migration[5.2]
  def change
    add_reference :deployments, :sample_unit, foreign_key: true
  end
end
