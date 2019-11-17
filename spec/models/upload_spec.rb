require "rails_helper"

RSpec.describe Upload do
  let(:upload) { FactoryBot.build_stubbed(:upload, :meta) }

  describe "Upload Validation" do
    context "An upload is valid if" do
      it "It contains data" do
        upload.data = "FAKE DATA"

        expect(upload).to be_valid
      end

      it "It has a filename" do
        upload.filename = "FAKE_FILENAME.csv"

        expect(upload).to be_valid
      end

      it "It has a type of meta or sono" do
        upload.upload_type = "meta"

        expect(upload).to be_valid

        upload.upload_type = "sono"

        expect(upload).to be_valid
      end
    end

    context "An upload is invalid if" do
      it "It contains no data" do
        upload.data = ""

        expect(upload).to_not be_valid
      end

      it "It contains no type" do
        upload.upload_type = ""

        expect(upload).to_not be_valid
      end

      it "It has a type that isn't meta or sono" do
        upload.upload_type = "FAKE TYPE"

        expect(upload).to_not be_valid
      end
    end
  end

end