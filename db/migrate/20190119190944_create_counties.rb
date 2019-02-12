class CreateCounties < ActiveRecord::Migration[5.2]
  def change
    create_table :counties do |t|
      t.references :state, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
