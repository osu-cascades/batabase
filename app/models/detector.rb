# frozen_string_literal: true

class Detector < ApplicationRecord
  validates :firmware, presence: true, allow_blank: false
  validates :manufacturer, presence: true, allow_blank: false
  validates :model, presence: true, allow_blank: false
  validates :serial_number, presence: true, allow_blank: false

  has_many :deployments

  belongs_to :organization

  def code
    organization.name + '-' + serial_number
  end

  def owner
    organization.name
  end
end
