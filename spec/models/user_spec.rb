require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'validations' do
    %i(first_name last_name email).each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    %i(last_name first_name email organization).each do |attribute|
      it { should validate_length_of(attribute).is_at_most(50) }
    end

    it { should validate_length_of(:state_code).is_at_most(8) }
  end
end
