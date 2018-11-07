require 'rails_helper'

RSpec.describe Software, type: :model do
  subject(:software) { Software.new(label: 'Example Label', summary: 'Example Summary') }

  describe 'validations' do
    it { should validate_presence_of(:label) }
    it { should validate_length_of(:label).is_at_most(50) }
    it { should validate_length_of(:summary).is_at_most(255) }
  end
end
