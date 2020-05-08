# frozen_string_literal: true

class Species < ApplicationRecord
  validates :code, presence: true, allow_blank: false
  validates :scientific_name, presence: true, allow_blank: false

  has_many :species_species_groups
  has_many :species_group, through: :species_species_groups
end
