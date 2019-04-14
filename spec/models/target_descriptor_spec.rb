require 'rails_helper'

RSpec.describe TargetDescriptor, type: :model do
  let(:detection_target) { build(:detection_target) }
  subject(:target_descriptor) { build(:target_descriptor, detection_target: detection_target) }


  describe 'validations' do
    it { should validate_presence_of(:label) }
  end

  describe 'detection_target_label' do
    it 'returns detection target\'s label' do
      expect(target_descriptor.detection_target_label).to eq('Example Detection Target')
    end
  end
end
