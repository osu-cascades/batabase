class CreateGeodeticSystem < ActiveRecord::Migration[6.0]
  def change
    create_table :geodetic_systems do |t|
      t.string :label
    end
  end
end
