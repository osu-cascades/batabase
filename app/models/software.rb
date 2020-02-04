# frozen_string_literal: true

class Software < ApplicationRecord
  validates :name, presence: true, allow_blank: false, inclusion: { in: ['Sonobat 4', 'Kaleidoscope'] }
  validates :version
  validates :classifier_package
  validates :acceptable_call_quality
  validates :sequence_decision_threshold
  validates :max_no_calls
  validates :log_file_notes
  validates :other_settings
end
