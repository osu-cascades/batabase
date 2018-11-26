require 'rails_helper'

RSpec.describe SampleDesignType, type: :model do
  subject(:sample_design_type) { build(:sample_design_type) }

  describe 'validations' do
    it { should validate_presence_of(:label) }
    it { should validate_length_of(:label).is_at_most(25) }
  end
end
