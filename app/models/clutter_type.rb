# frozen_string_literal: true

class ClutterType < ApplicationRecord
  validates :name, presence: true, allow_blank: false
end
