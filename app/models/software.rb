class Software < ApplicationRecord
  validates :name, presence: true, allow_blank: false, inclusion: { in: [ "Sonobat 4", "Kaleidoscope" ] }
end
