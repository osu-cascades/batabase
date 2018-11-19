require 'rails_helper'

RSpec.describe State, type: :model do
  subject(:state) { State.new(state_code: 'ID', state_name: 'Idaho') }

  describe 'validations' do
    it { should validate_presence_of(:label) }
    it { should validate_length_of(:state_code).is_at_most(2) }
    it { should validate_length_of(:state_name).is_at_most(50) }
  end
end
