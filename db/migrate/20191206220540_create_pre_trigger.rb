class CreatePreTrigger < ActiveRecord::Migration[6.0]
  def change
    create_table :pre_triggers do |t|
      t.float :delay, precision: 2, scale: 1
    end
  end
end
