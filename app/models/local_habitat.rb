class LocalHabitat < ApplicationRecord
  validates :label, presence: true, allow_blank: false, inclusion: {
    in: [ "mixed conifer", "dry conifer", "hardwood", "alpine forest", "mesic forest", "urban", "agriculture", "grassland", "shrub-steppe"]
  }
end