class AddSampleUnitRefToSampleUnitCounty < ActiveRecord::Migration[6.0]
  def change
    add_reference :sample_unit_counties, :sample_unit, null: false, foreign_key: true
  end
end
