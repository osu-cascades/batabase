class State < ApplicationRecord
  has_many :counties

  validates :state_code, :state_name, presence: true
  validates_length_of :state_code, maximum: 2
  validates_length_of :state_name, maximum: 50
end
