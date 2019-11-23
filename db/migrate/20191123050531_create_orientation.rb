class CreateOrientation < ActiveRecord::Migration[6.0]
  def change
    create_table :orientations do |t|
      t.string :direction
    end
  end
end
