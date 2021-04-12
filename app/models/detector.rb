# frozen_string_literal: true

class Detector < ApplicationRecord
  ORGANIZATION_NAMES = { # rubocop:disable Style/MutableConstant
    'Oregon State University-Cascades' => 'OSU',
    'National Park Service' => 'NPS',
    'Oregon Department of Fish and Wildlife' => 'ODFW',
    'Bureau of Land Management' => 'BLM',
    'United States Forest Service' => 'USFS'
  }
  ORGANIZATION_NAMES.default = 'Other'
  ORGANIZATION_NAMES.freeze

  validates :firmware, presence: true, allow_blank: false
  validates :manufacturer, presence: true, allow_blank: false
  validates :model, presence: true, allow_blank: false
  validates :serial_number, presence: true, allow_blank: false

  has_many :deployments

  belongs_to :organization

  accepts_nested_attributes_for :organization

  def code
    organization.name + '-' + serial_number
  end

  def owner
    organization.name
  end
end
