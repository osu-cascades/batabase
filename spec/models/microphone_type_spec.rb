require 'rails_helper'

RSpec.describe MicrophoneType, type: :model do
  subject(:microhone_type){ MicrophoneType.new(label: 'Example Label') }

  describe 'validations' do
    it {should validate_presence_of(:label)}
    it {should validate_length_of(:label).is_at_most(50)}
  end
end
