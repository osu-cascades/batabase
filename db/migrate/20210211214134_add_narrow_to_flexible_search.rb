class AddNarrowToFlexibleSearch < ActiveRecord::Migration[6.0]
  def change
    add_column :flexible_searches, :narrow, :string
  end
end
