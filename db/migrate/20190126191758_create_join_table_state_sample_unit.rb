class CreateJoinTableStateSampleUnit < ActiveRecord::Migration[5.2]
  def change
    create_join_table :states, :sample_units do |t|
      t.index [:state_id, :sample_unit_id]
      t.index [:sample_unit_id, :state_id]
    end
  end
end
