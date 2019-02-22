class BroadHabitat < ApplicationRecord
  validates :label, presence: true
  validates_length_of :label, maximum: 50
  has_many :broad_habitat_forms
end
