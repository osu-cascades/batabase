class County < ApplicationRecord
  has_many :sample_unit_counties
  has_many :sample_units, through: :sample_unit_counties
  belongs_to :state
end
