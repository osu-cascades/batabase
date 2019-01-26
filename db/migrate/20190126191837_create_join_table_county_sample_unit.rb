class CreateJoinTableCountySampleUnit < ActiveRecord::Migration[5.2]
  def change
    create_join_table :counties, :sample_units do |t|
      # t.index [:county_id, :sample_unit_id]
      # t.index [:sample_unit_id, :county_id]
    end
  end
end
