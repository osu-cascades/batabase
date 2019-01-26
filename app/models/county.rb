class County < ApplicationRecord
  has_and_belongs_to_many :sample_units
  belongs_to :state
end
