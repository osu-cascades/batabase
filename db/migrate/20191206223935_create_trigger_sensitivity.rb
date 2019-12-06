class CreateTriggerSensitivity < ActiveRecord::Migration[6.0]
  def change
    create_table :trigger_sensitivities do |t|
      t.string :sensitivity
    end
  end
end
