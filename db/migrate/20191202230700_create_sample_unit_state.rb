class CreateSampleUnitState < ActiveRecord::Migration[6.0]
  def change
    create_table :sample_unit_states do |t|
      t.decimal :percentage, precision: 5, scale: 2
    end
  end
end
