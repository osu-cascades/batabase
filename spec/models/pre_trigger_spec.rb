require "rails_helper"

RSpec.describe PreTrigger, type: :model do
  let(:pre_trigger) { FactoryBot.build_stubbed(:pre_trigger) }

  describe "Pre Trigger Validation" do
    context "A pre trigger is valid if" do
      it "It has a delay that's a float" do
        pre_trigger.delay = 4.2

        expect(pre_trigger).to be_valid
      end
    end

    context "A pre trigger is invalid if" do
      it "It has a delay that isn't a float" do
        pre_trigger.delay = nil

        expect(pre_trigger).to_not be_valid

        pre_trigger.delay = "INVALID"

        expect(pre_trigger).to_not be_valid
      end
    end
  end

end