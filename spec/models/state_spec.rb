require 'rails_helper'

RSpec.describe State, type: :model do
  subject(:state) { State.new(state_code: 'ID', state_name: 'Idaho') }

  describe 'validations' do
    %i(state_code state_name).each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    it { should validate_length_of(:state_code).is_at_most(2) }
    it { should validate_length_of(:state_name).is_at_most(50) }
  end

  describe 'assocations' do
    it { should have_many(:sample_unit_states) }
    it { should have_many(:sample_units).through(:sample_unit_states) }
    it { should have_many(:counties) }
  end
end
