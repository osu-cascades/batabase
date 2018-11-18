require 'rails_helper'

RSpec.describe SampleDesign, type: :model do
  subject(:report) { SampleDesign.new(label: 'Example Label', description: 'Example Description', sample_design_type_id: 1) }

  describe 'validations' do
    %i(label description).each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    it { should validate_length_of(:label).is_at_most(50) }
  end
end
