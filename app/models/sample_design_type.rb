class SampleDesignType < ApplicationRecord
  validates :label, presence: true
  validates_length_of :label, maximum: 25
  has_many :sample_design
end
