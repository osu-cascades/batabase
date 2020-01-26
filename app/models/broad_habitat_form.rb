# frozen_string_literal: true

class BroadHabitatForm < ApplicationRecord
  validates :name, presence: true, allow_blank: false

  belongs_to :broad_habitat
  has_many :sample_units
end
