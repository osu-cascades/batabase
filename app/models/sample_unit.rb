class SampleUnit < ApplicationRecord
  validates :site_code, presence: true
  validates_length_of :site_code, maximum: 20
  validates_length_of :agency, maximum: 50

  has_many :detector_locations

  belongs_to :state_1, class_name: 'State', foreign_key: :state_1_id, optional: true
  belongs_to :state_2, class_name: 'State', foreign_key: :state_2_id, optional: true
  belongs_to :broad_habitat

  def primary_state
    state_1.try(:state_code)
  end

  def primary_county
    county_1
  end
end
