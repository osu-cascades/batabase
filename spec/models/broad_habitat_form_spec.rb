require "rails_helper"

RSpec.describe BroadHabitatForm, type: :model do
  let(:broad_habitat_form) { FactoryBot.build_stubbed(:broad_habitat_form) }

  describe "Broad Habitat Validation" do
    context "An broad habitat is valid if" do
      it "It has a habitat label" do
        broad_habitat_form.label = "FAKE LABEL"

        expect(broad_habitat_form).to be_valid
      end
    end

    context "An broad habitat is invalid if" do
      it "It has no habitat label" do
        broad_habitat_form.label = ""

        expect(broad_habitat_form).to_not be_valid
      end
    end
  end

end