class SampleUnitDecorator < ApplicationDecorator
  delegate_all
  decorates_finders
  decorates :sample_unit
  decorates_association :detector_locations

  def sub_title
    "#{primary_county}, #{primary_state}"
  end
end
