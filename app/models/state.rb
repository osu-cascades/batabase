class State < ApplicationRecord
  has_many :sample_unit_states
  has_many :sample_units, through: :sample_unit_states

  has_many :counties

  validates :state_code, :state_name, presence: true
  validates_length_of :state_code, maximum: 2
  validates_length_of :state_name, maximum: 50
end
