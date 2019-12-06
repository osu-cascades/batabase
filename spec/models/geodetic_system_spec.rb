require "rails_helper"

RSpec.describe GeodeticSystem, type: :model do
  let(:geodetic_system) { FactoryBot.build_stubbed(:geodetic_system) }

  describe "Geodetic System Validation" do
    context "Geodetic system is valid if" do
      it "It has a label" do
        geodetic_system.label = "FAKE LABEL"

        expect(geodetic_system).to be_valid
      end
    end

    context "Geodetic system is invalid if" do
      it "It contains no label" do
        geodetic_system.label = ""

        expect(geodetic_system).to_not be_valid
      end
    end
  end

end