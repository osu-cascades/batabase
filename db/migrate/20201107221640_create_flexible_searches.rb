class CreateFlexibleSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :flexible_searches do |t|
      t.string :name

      t.timestamps
    end
  end
end
