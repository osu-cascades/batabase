require 'rails_helper'

RSpec.describe LocalHabitat, type: :model do
  subject(:local_habitat) { build(:local_habitat) }

  describe 'validations' do
    it { should validate_presence_of(:label) }
    it { should validate_length_of(:label).is_at_most(50) }
  end
end
