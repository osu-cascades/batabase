class Report < ApplicationRecord
  validates :report_name, :report_label, presence: true
  validates_length_of :report_name, :report_label, maximum: 255
end
