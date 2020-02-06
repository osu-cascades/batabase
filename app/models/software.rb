# frozen_string_literal: true

class Software < ApplicationRecord
  validates :name, presence: true, allow_blank: false, inclusion: { in: ['Sonobat 4', 'Kaleidoscope'] }
  validates :acceptable_call_quality, numericality: true
  validates :sequence_decision_threshold, numericality: true
  validates :max_no_calls, numericality: { only_integer: true }

  belongs_to :contact
  # TODO: this should be implemented once we have a deployment model
  # has_many :deployments
end
