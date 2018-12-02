class CreateStudyAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :study_areas do |t|
      t.string :name
      t.belongs_to :state, index: true

      t.timestamps
    end
  end
end
