class Species < ApplicationRecord
  has_and_belongs_to_many :species_groups

  validates :code, :scientific_name, presence: true
  validates_length_of :code, maximum: 10
  validates_length_of :common_name, :scientific_name, maximum: 255
end
