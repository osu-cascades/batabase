class CreateSearchFields < ActiveRecord::Migration[6.0]
  def change
    create_table :search_fields do |t|
      t.string :name
      t.references :flexible_search, null: false, foreign_key: true

      t.timestamps
    end
  end
end
