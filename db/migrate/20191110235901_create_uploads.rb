class CreateUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :uploads do |t|
      t.string :file_name
      t.string :data
      t.string :upload_type
    end
  end
end
