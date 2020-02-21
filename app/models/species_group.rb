class SpeciesGroup < ApplicationRecord
  has_and_belongs_to_many :species
  
  validates :lable, presence: true
end