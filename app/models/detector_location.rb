# frozen_string_literal: true

class DetectorLocation < ApplicationRecord
  LOCAL_HABITAT_NAMES = {
    'mixedconifer' => 'mixed conifer',
    'dryconifer' => 'dry conifer',
    'alpineforest' => 'alpine forest',
    'mesicforest' => 'mesic forest',
    'urban' => 'urban',
    'agriculture' => 'agriculture',
    'grassland' => 'grassland',
    'shrub-steppe' => 'shrub-steppe'
  }.freeze

  TARGET_DESCRIPTOR_NAMES = {
    'river' => 'river',
    'stream' => 'stream',
    'spring' => 'spring',
    'lake' => 'lake',
    'pond' => 'pond',
    'wetland' => 'wetland',
    'stocktank/trough' => 'stocktank/trough',
    'largecanyonbottom' => 'large canyon bottom',
    'largecanyontop' => 'large canyon top',
    'smallarroyodrygulchbottom' => 'small arroyo dry gulch bottom',
    'smallarroyodrygulchtop' => 'small arroyo dry gulch top',
    'ridgetop' => 'ridge top',
    'cliffbottom' => 'cliff bottom',
    'clifftop' => 'cliff top',
    'large' => 'large',
    'medium' => 'medium',
    'small' => 'small',
    'oldyoungforest' => 'old young forest',
    'forestopenland' => 'forest open land',
    'smallgap' => 'small gap',
    'trail' => 'trail',
    'roadway' => 'roadway',
    'other' => 'other'
  }.freeze

  validates :quad_id, presence: true, allow_blank: false, inclusion: {
    in: ['NW', 'NE', 'SW', 'SE']
  }

  validates :quad_no, allow_nil: true, inclusion: 1..20

  has_many :deployments

  belongs_to :detection_target
  belongs_to :target_descriptor
  belongs_to :local_habitat
  belongs_to :sample_unit

  before_create :set_location_identifier

  private

  def set_location_identifier
    self.location_identifier = "#{sample_unit.code}_#{quad_id}#{quad_no}"
  end
end
