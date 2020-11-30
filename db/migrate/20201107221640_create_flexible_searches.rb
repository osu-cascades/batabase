class CreateFlexibleSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :flexible_searches do |t|
      t.string :name
      t.string :state
      t.string :sample_unit
      t.string :location_id
      t.string :agency
      t.datetime :night
      t.string :manual_idspp1
      t.string :manual_idspp2

      t.timestamps
    end
  end
end
