require "rails_helper"

RSpec.describe BroadHabitat, type: :model do
  let(:broad_habitat) { FactoryBot.build_stubbed(:broad_habitat) }

  describe "Broad Habitat Validation" do
    context "An broad habitat is valid if" do
      it "It has a habitat name" do
        broad_habitat.name = "FAKE NAME"

        expect(broad_habitat).to be_valid
      end
    end

    context "An broad habitat is invalid if" do
      it "It has no habitat name" do
        broad_habitat.name = ""

        expect(broad_habitat).to_not be_valid
      end
    end
  end

end