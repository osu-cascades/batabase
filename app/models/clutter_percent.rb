# frozen_string_literal: true

class ClutterPercent < ApplicationRecord
  validates :label, presence: true, allow_blank: false

  has_many :deployments
end
