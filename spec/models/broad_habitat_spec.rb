require "rails_helper"

RSpec.describe BroadHabitat do
  let(:broad_habitat) { FactoryBot.build_stubbed(:broad_habitat) }

  describe "Broad Habitat Validation" do
    context "An broad habitat is valid if" do
      it "It has a habitat class" do
        broad_habitat.habitat_class = "FAKE CLASS"

        expect(broad_habitat).to be_valid
      end

      it "It has a habitat form" do
        broad_habitat.habitat_form = "FAKE FORM"

        expect(broad_habitat).to be_valid
      end
    end

    context "An broad habitat is invalid if" do
      it "It has no habitat class" do
        broad_habitat.habitat_class = ""

        expect(broad_habitat).to_not be_valid
      end

      it "It has no habitat form" do
        broad_habitat.habitat_form = ""

        expect(broad_habitat).to_not be_valid
      end
    end
  end

end