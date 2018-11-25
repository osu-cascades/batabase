class SampleDesign < ApplicationRecord
  validates :label, :description, presence: true
  validates_length_of :label, maximum: 50
  belongs_to :sample_design_type
end
