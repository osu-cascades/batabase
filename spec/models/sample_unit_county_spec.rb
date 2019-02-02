require 'rails_helper'

RSpec.describe SampleUnitCounty, type: :model do
  subject(:sample_unit_county) { create(:sample_unit_county) }

  describe 'associations' do
    it { should belong_to(:sample_unit) }
    it { should belong_to(:county) }
  end
end
