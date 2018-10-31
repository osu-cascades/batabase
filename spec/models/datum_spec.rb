require 'rails_helper'

RSpec.describe Datum, type: :model do
  subject(:datum) { Datum.new(label: 'Example Label') }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:label) }
  end
end
