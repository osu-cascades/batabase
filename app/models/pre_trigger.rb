# frozen_string_literal: true

class PreTrigger < ApplicationRecord
  validates :delay, numericality: true
end
