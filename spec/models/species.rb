require 'rails_helper'

RSpec.describe Species, type: :model do
  subject(:species) { build(:species) }

  describe 'validations' do
    %i(code scientific_name).each do |attribute|
      it { should validate_presence_of(attribute) }
    end

    it { should validate_length_of(:code).is_at_most(10) }

    %i(common_name scientific_name).each do |attribute|
      it { should validate_length_of(attribute).is_at_most(255) }
    end
  end
end
