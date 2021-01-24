class CreateSpecifications < ActiveRecord::Migration[6.0]
  def change
    create_table :specifications do |t|
      t.references :table, null: false, foreign_key: true
      t.references :flexible_search, null: false, foreign_key: true

      t.timestamps
    end
  end
end
