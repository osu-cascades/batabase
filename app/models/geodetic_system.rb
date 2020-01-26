# frozen_string_literal: true

class GeodeticSystem < ApplicationRecord
  validates :label, presence: true, allow_blank: false
end
