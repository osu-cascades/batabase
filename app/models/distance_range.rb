# frozen_string_literal: true

class DistanceRange < ApplicationRecord
  validates :label, presence: true, allow_blank: false

  has_many :deployments
end
