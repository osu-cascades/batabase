require 'rails_helper'

RSpec.describe SampleUnitState, type: :model do
  subject(:sample_unit_state) { create(:sample_unit_state) }

  describe 'associations' do
    it { should belong_to(:sample_unit) }
    it { should belong_to(:state) }
  end
end
