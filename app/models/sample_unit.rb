class SampleUnit < ApplicationRecord
  validates :site_code, presence: true
  validates_length_of :site_code, maximum: 20
  validates_length_of :federal_agency, maximum: 50
end
