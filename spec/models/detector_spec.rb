require "rails_helper"

RSpec.describe Detector, type: :model do
  let(:detector) { FactoryBot.build_stubbed(:detector, :blm) }

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

      it "It has an owner" do
        [ "ODFW", "NPS", "BLM", "USFS", "OSU", "Other" ].each do |owner|
          detector.owner = owner
          expect(detector).to be_valid
        end
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

      it "It contains no owner" do
        detector.owner = ""

        expect(detector).to_not be_valid
      end

      it "It has a label that isn't pre-specified" do
        detector.owner = "BAD OWNER"

        expect(detector).to_not be_valid
      end
    end
  end

end