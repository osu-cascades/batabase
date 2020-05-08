# frozen_string_literal: true

class SpeciesSpeciesGroup < ApplicationRecord
  belongs_to :species, optional: true
  belongs_to :species_group
end
