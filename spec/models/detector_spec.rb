require 'rails_helper'

RSpec.describe Detector, type: :model do
  subject(:detector) { build(:detector) }

  describe 'validations' do
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:serial_num) }
    it { should validate_presence_of(:manufacturer) }

    it { should validate_length_of(:code).is_at_most(20) }
    it { should validate_length_of(:serial_num).is_at_most(50) }
    it { should validate_length_of(:model).is_at_most(50) }
    it { should validate_length_of(:manufacturer).is_at_most(50) }
    it { should validate_length_of(:firmware).is_at_most(50) }
  end
end
