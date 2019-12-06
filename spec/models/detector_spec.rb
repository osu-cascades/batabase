require "rails_helper"

RSpec.describe Detector, type: :model do
  let(:detector) { FactoryBot.build_stubbed(:detector) }

  describe "Detector Validation" do
    context "Detector is valid if" do
      it "It has a manufacturer" do
        detector.manufacturer = "FAKE MANUFACTURER"

        expect(detector).to be_valid
      end

      it "It has a model" do
        detector.model = "FAKE MODEL"

        expect(detector).to be_valid
      end

      it "It has a serial number" do
        detector.serial_number = "FAKE SERIAL NUMBER"

        expect(detector).to be_valid
      end
    end

    context "Detector is invalid if" do
      it "It has no manufacturer" do
        detector.manufacturer = ""

        expect(detector).to_not be_valid
      end

      it "It has no model" do
        detector.model = ""

        expect(detector).to_not be_valid
      end

      it "It has no serial number" do
        detector.serial_number = ""

        expect(detector).to_not be_valid
      end
    end
  end

  describe "Detector Functionality" do
    context "Organization Interactions" do
      it "It can return who owns the detector" do
        expect(detector.owner).to eq('FAKE NAME')
      end
    end
  end

end