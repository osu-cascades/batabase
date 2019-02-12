class SpeciesGroup < ApplicationRecord
  has_and_belongs_to_many :species

  validates :label, presence: true
  validates_length_of :label, maximum: 50
  validates_length_of :summary, maximum: 255
end
