require "rails_helper"

RSpec.describe TriggerSensitivity, type: :model do
  let(:trigger_sensitivity) { FactoryBot.build_stubbed(:trigger_sensitivity) }

  describe "Trigger Sensitivity Validation" do
    context "Trigger sensitivity is valid if" do
      it "It has a valid sensitivity" do
        [ "VERY LOW", "LOW", "MED", "HIGH", "VERY HIGH" ].each do |sensitivity|
          trigger_sensitivity.sensitivity = sensitivity
          expect(trigger_sensitivity).to be_valid
        end
      end
    end

    context "Trigger sensitivity is invalid if" do
      it "It has no sensitivity" do
        trigger_sensitivity.sensitivity = ""

        expect(trigger_sensitivity).to_not be_valid
      end

      it "It has sensitivity that isn't a provided setting" do
        trigger_sensitivity.sensitivity = "INVALID SENSITIVITY"

        expect(trigger_sensitivity).to_not be_valid
      end
    end
  end

end