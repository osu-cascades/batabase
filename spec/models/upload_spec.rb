require "rails_helper"

RSpec.describe Upload do
  let(:valid_upload) { FactoryBot.build_stubbed(:upload) }
  let(:invalid_upload) { FactoryBot.build_stubbed(:upload, :empty_upload) }

  describe "Upload Validation" do
    context "A upload is valid if" do
      it "It contains data" do
        valid_upload.data = "FAKE DATA"

        expect(valid_upload).to be_valid
      end

      it "It has a type of meta or sono" do
        valid_upload.type = "meta"

        expect(valid_upload).to be_valid

        valid_upload.type = "sono"

        expect(valid_upload).to be_valid
      end
    end

    context "A upload is invalid if" do
      it "It contains no data" do
        invalid_upload.data = ""

        expect(invalid_upload).to_not be_valid
      end

      it "It has a type that isn't meta or sono" do
        invalid_upload.type = "FAKE TYPE"

        expect(invalid_upload).to_not be_valid
      end
    end
  end

end