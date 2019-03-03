class DetectorLocationDecorator < ApplicationDecorator
  delegate_all
  decorates :detector_location

  def coordinates
    "[#{latitude}, #{longitude}]"
  end
end
