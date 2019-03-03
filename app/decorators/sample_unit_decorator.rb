class SampleUnitDecorator < ApplicationDecorator
  delegate_all
  decorates :sample_unit
  decorates_association :detector_locations
end
