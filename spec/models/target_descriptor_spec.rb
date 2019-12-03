require "rails_helper"

RSpec.describe TargetDescriptor, type: :model do
  let(:target_descriptor) { FactoryBot.build_stubbed(:target_descriptor) }

  describe "Target Descriptor Validation" do
    context "An target descriptor is valid if" do
      it "It has a label" do
        target_descriptor.label = "FAKE LABEL"

        expect(target_descriptor).to be_valid
      end
    end

    context "An target descriptor is invalid if" do
      it "It has no label" do
        target_descriptor.label = ""

        expect(target_descriptor).to_not be_valid
      end
    end
  end

end