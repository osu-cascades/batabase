require 'rails_helper'

RSpec.describe BroadHabitat, type: :model do
  subject(:broad_habitat) { BroadHabitat.new(label: 'Example Label') }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:label) }
  end
end
