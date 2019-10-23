class BroadHabitatCreator
  def initialize
    [
      { bh: 'Forest & Woodland', form: 'Cool Temperate Forest & Woodland' },
      { bh: 'Forest & Woodland', form: 'Warm Temperate Forest & Woodland' },
      { bh: 'Shrub & Herb Vegetation', form: 'Temperate to Polar Freshwater Marsh, Wet Meadow & Shrubland' },
      { bh: 'Desert & Semi-Desert', form: 'Cool Semi-Desert Scrub & Grassland' },
      { bh: 'Shrub & Herb Vegetation', form: 'Mediterranean Scrub & Grassland' },
      { bh: 'Agricultural & Developed Vegetation', form: 'Row & Close Grain Crop Cultural Formation' },
      { bh: 'Developed & Other Human Use', form: 'Developed & Urban' },
      { bh: 'Forest & Woodland', form: 'Temperate Flooded & Swamp Forest' },
      { bh: 'Shrub & Herb Vegetation', form: 'Temperate Grassland & Shrubland' },
      { bh: 'Agricultural & Developed Vegetation', form: 'Pasture & Hay Field Crop' },
      { bh: 'Polar & High Montane Scrub', form: ' Grassland & Barrens' },
      { bh: 'Polar & High Montane Scrub', form: 'Temperate & Boreal Alpine Tundra' },
      { bh: 'Recently Disturbed or Modified', form: 'Recently Disturbed or Modified' },
      { bh: 'Desert & Semi-Desert', form: 'Warm Desert & Semi-Desert Scrub & Grassland' },
      { bh: 'Introduced & Semi Natural Vegetation', form: 'Introduced & Semi Natural Vegetation' },
      { bh: 'Open Water', form: 'Open Water' },
      { bh: 'Shrub & Herb Vegetation', form: 'Salt Marsh' },
      { bh: 'Shrub & Herb Vegetation', form: 'Temperate to Polar Bog & Fen' },
      { bh: 'Open Rock Vegetation', form: 'Temperate & Boreal Cliff, Scree & Other Rock Vegetation' },
      { bh: 'Aquatic Vegetation', form: 'Benthic Vascular Saltwater Vegetation' },
      { bh: 'Nonvascular & Sparse Vascular Rock Vegetation', form: 'Barren' },
      { bh: 'Shrub & Herb Vegetation', form: 'Temperate to Polar Scrub & Herb Coastal Vegetation' },
      { bh: 'Developed & Other Human Use', form: 'Current and Historic Mining Activity' },
      { bh: 'Polar & High Montane Scrub', form: 'Grassland & Barrens, Temperate & Boreal Alpine Tundra' }
    ].each do |item|
      broad_habitat = BroadHabitat.find_by(label: item[:bh])
      broad_habitat_form = BroadHabitatForm.find_by(label: item[:form])

      if broad_habitat.nil?
        BroadHabitat.create!(label: item[:bh])
      end

      if broad_habitat_form.nil?
        broad_habitat_id = BroadHabitat.find_by(label: item[:bh]).id
        BroadHabitatForm.create!(label: item[:form], broad_habitat_id: broad_habitat_id)
      end
    end
  end
end
