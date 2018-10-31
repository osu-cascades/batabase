class Datum < ApplicationRecord
  ActiveRecord::Base.pluralize_table_names = false
  validates :label, presence: true
end
