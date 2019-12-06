require "rails_helper"

RSpec.describe RecordingLength, type: :model do
  let(:recording_length) { FactoryBot.build_stubbed(:recording_length) }

  describe "Recording Length Validation" do
    context "A recording length is valid if" do
      it "It has a length that's a float" do
        recording_length.length = 4.2

        expect(recording_length).to be_valid
      end
    end

    context "A recording length is invalid if" do
      it "It has a length that isn't a float" do
        recording_length.length = nil

        expect(recording_length).to_not be_valid

        recording_length.length = "INVALID"

        expect(recording_length).to_not be_valid
      end

      it "It has a length of zero" do
        recording_length.length = 0

        expect(recording_length).to_not be_valid
      end
    end
  end

end