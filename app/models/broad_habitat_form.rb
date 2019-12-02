class BroadHabitatForm < ApplicationRecord
  validates :label, presence: true, allow_blank: false

  belongs_to :broad_habitat
  has_many :sample_units
end
