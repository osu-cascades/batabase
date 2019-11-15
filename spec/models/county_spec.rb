require "rails_helper"

RSpec.describe County do
  let(:county) { FactoryBot.build_stubbed(:county) }

  describe "County Validation" do
    context "A county is valid if" do
      it "It has a name" do
        county.name = "FAKE NAME"

        expect(county).to be_valid
      end
    end

    context "A county is invalid if" do
      it "It has no name" do
        county.name = ""

        expect(county).to_not be_valid
      end
    end
  end

  describe 'County Functionality' do
    context 'A county knows what state it is in' do
      
    end
  end
end