class AddFieldsHashToFlexibleSearches < ActiveRecord::Migration[6.0]
  def change
    add_column :flexible_searches, :fields_hash, :text
  end
end
