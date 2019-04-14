require 'rails_helper'

RSpec.describe SampleUnitDecorator do
  let(:county) { build(:county) }
  let(:state) { build(:state) }
  let(:sample_unit) { build(:sample_unit, counties: [county], states: [state] ).decorate }

  describe '#sample_unit_subtitle' do
    it 'should return a county and state' do 
      expect(sample_unit.sub_title).to eql('Example County Name, OR')
    end
  end

end
