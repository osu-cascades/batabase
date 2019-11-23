class Orientation < ApplicationRecord
  validates :direction, presence: true, allow_blank: false, inclusion: { in: [ "N", "W", "E", "S", "NW", "NE", "SW", "SE" ] }
end