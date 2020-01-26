# frozen_string_literal: true

class BroadHabitat < ApplicationRecord
  validates :name, presence: true, allow_blank: false

  has_many :broad_habitat_forms, dependent: :destroy
  has_many :sample_units
end
