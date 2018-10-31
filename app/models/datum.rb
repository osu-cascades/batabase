class Datum < ApplicationRecord
  self.table_name = 'datums'

  validates :label, presence: true
end
