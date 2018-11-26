require 'rails_helper'

RSpec.describe SampleDesign, type: :model do
  subject(:sample_design) { build(:sample_design) }

  describe 'validations' do
    %i(label description).each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    it { should validate_length_of(:label).is_at_most(50) }
  end

  describe 'associations' do
    it { should belong_to(:sample_design_type) }
  end
end
