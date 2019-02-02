class CreateSampleUnitCounties < ActiveRecord::Migration[5.2]
  def change
    create_table :sample_unit_counties do |t|
      t.belongs_to :sample_unit, index: true
      t.belongs_to :county, index: true
      t.float :percentage
    end
  end
end
