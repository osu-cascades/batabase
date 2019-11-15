require "rails_helper"

RSpec.describe State do
  let(:state) { FactoryBot.build_stubbed(:state) }

  describe "State Validation" do
    context "A state is valid if" do
      it "It has a name" do
        state.name = "FAKE NAME"

        expect(state).to be_valid
      end

      it "It has an abbreviation" do
        state.abbreviation = "FAKE ABBREVIATION"

        expect(state).to be_valid
      end
    end

    context "A state is invalid if" do
      it "It has no name" do
        state.name = ""

        expect(state).to_not be_valid
      end

      it "It has no abbreviation" do
        state.abbreviation = ""

        expect(state).to_not be_valid
      end
    end
  end

end