class DetectorLocationDecorator < ApplicationDecorator
  delegate_all
  decorates :detector_location

  def detection_target_label
    detection_target.try(:label)
  end

  def coordinates
    "[#{latitude}, #{longitude}]"
  end

  def quad_id
    location_name.split('_')[1].match(/[a-zA-Z]{2}/)
  end

  def quad_number
    qn = location_name.split('_')[1].match(/\d{1}/)
    qn.nil? ? '1' : qn
  end

  def sample_unit_id
    sample_unit.id
  end

  def datum
    geodetic_system.nil? ? 'NAD83' : geodetic_system
  end
end
