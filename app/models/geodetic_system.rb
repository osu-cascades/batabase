class GeodeticSystem < ApplicationRecord
  validates :label, presence: true, allow_blank: false
end