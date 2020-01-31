# frozen_string_literal: true

class Detector < ApplicationRecord
  validates :firmware, presence: true, allow_blank: false
  validates :manufacturer, presence: true, allow_blank: false
  validates :model, presence: true, allow_blank: false
  validates :serial_number, presence: true, allow_blank: false

  belongs_to :organization

  def owner
    organization.name
  end
end
