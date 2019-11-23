class State < ApplicationRecord
  # TODO: add length check
  validates :abbreviation, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false

  has_many :counties, dependent: :destroy
  has_many :sample_unit_states
  has_many :sample_units, through: :sample_unit_states


  def counties?
    !counties.empty?
  end
end
