class County < ApplicationRecord
  validates :name, presence: true, allow_blank: false

  has_many :sample_unit_counties
  has_many :sample_units, through: :sample_unit_counties

  belongs_to :state

  def get_state
    self.state.name
  end

  def get_abbreviation
    self.state.abbreviation
  end
end
