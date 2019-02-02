class CreateSampleUnitsStates < ActiveRecord::Migration[5.2]
  def change
    create_table :sample_unit_states do |t|
      t.belongs_to :sample_unit, index: true
      t.belongs_to :state, index: true
      t.float :percentage
    end
  end
end
