# frozen_string_literal: true

class Orientation < ApplicationRecord
  validates :direction, presence: true, allow_blank: false, inclusion: { in: %w[N W E S NW NE SW SE] }
end
