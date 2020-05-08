# frozen_string_literal: true

class SpeciesGroup < ApplicationRecord
  validates :label, presence: true, allow_blank: false
  validates :summary, presence: true, allow_blank: false

  has_many :species_species_groups
  has_many :species, through: :species_species_groups
end
