# frozen_string_literal: true

class AddStateRefToCounties < ActiveRecord::Migration[6.0]
  def change
    add_reference :counties, :state, null: false, foreign_key: true
  end
end
