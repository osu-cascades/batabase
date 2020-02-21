class Species < ApplicationRecord
  has_and_belongs_to_many :species_groups

  validates :code, presence: true
  validates :scientific_name, presence: true
end