# frozen_string_literal: true

class CreateSpeciesAndSpeciesGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :species do |t|
      t.string :code
      t.string :common_name
      t.string :scientific_name
    end

    create_table :species_groups do |t|
      t.string :label
      t.string :summary
    end

    create_table :species_species_groups, id: false do |t|
      t.belongs_to :species, index: true
      t.belongs_to :species_group, index: true
    end
  end
end
