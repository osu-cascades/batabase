require "rails_helper"

RSpec.describe Software do
  let(:software) { FactoryBot.build_stubbed(:software, :sonobat) }

  describe "Software Validation" do
    context "Software is valid if" do
      it "It has a name of Sonobat 4 or Kaleidoscope" do
        software.name = "Sonobat 4"

        expect(software).to be_valid

        software.name = "Kaleidoscope"

        expect(software).to be_valid
      end
    end

    context "Software is invalid if" do
      it "It has no name" do
        software.name = ""

        expect(software).to_not be_valid
      end

      it "It has name that isn't Sonobat 4 or Kaleidoscope" do
        software.name = "Sonobat 3"

        expect(software).to_not be_valid

        software.name = "Caleidoscope"

        expect(software).to_not be_valid
      end
    end
  end

end