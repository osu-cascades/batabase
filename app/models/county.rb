# frozen_string_literal: true

class County < ApplicationRecord
  validates :name, presence: true, allow_blank: false

  has_many :sample_unit_counties
  has_many :sample_units, through: :sample_unit_counties

  belongs_to :state
end
