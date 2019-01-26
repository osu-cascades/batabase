require 'rails_helper'

RSpec.describe County, type: :model do
  describe 'assocations' do
    it { should belong_to(:state) }
    it { should have_and_belong_to_many(:sample_units) }
  end
end
