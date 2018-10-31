require 'rails_helper'

RSpec.describe Detector, type: :model do
  subject(:detector) { build(:detector) }

  describe 'validations' do
    %i(code serial_num manufacturer).each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    it { should validate_length_of(:code).is_at_most(20) }

    %i(serial_num model manufacturer firmware).each do |attribute|
      it { should validate_length_of(attribute).is_at_most(50) }
    end
  end
end
