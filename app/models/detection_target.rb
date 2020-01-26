# frozen_string_literal: true

class DetectionTarget < ApplicationRecord
  validates :label, presence: true, allow_blank: false
  has_many :target_descriptors, dependent: :destroy
end
