class SampleDesign < ApplicationRecord
  validates :label, :description, presence: true
  validates_length_of :label, maximum: 50
end
