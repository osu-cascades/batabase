# frozen_string_literal: true

class CreateOrganization < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
    end
  end
end
