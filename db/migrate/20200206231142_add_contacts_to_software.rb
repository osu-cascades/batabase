class AddContactsToSoftware < ActiveRecord::Migration[6.0]
  def change
    add_reference :softwares, :contact, null: false, foreign_key: true
  end
end
