class Datum < ApplicationRecord
  self.table_name = 'datums'

  validates :label, presence: true
  validates_length_of :label, maximum: 50
end
