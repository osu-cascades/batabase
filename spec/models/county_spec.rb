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

  describe "County Functionality" do
    context "State interactions" do
      it "It can retrieve the name of the state it's in" do
        expected = "FAKE NAME"
        actual = county.get_state

        expect(actual).to eq(expected)
      end

      it "It can retrieve the abbreviation of the state it's in" do
        expected = "FAKE ABBREVIATION"
        actual = county.get_abbreviation

        expect(actual).to eq(expected)
      end
    end
  end
end