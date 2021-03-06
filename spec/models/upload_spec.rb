# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Upload, type: :model do
  let(:upload) { FactoryBot.build_stubbed(:upload) }

  describe 'Upload Validation' do
    context 'An upload is valid if' do
      it 'It contains data' do
        upload.data = 'FAKE DATA'

        expect(upload).to be_valid
      end

      it 'It has a type of Site Metadata or Sonobat Output' do
        upload.upload_type = 'Site Metadata'

        expect(upload).to be_valid

        upload.upload_type = 'Sonobat Output'

        expect(upload).to be_valid
      end
    end

    context 'An upload is invalid if' do
      it 'It contains no data' do
        upload.data = ''

        expect(upload).to_not be_valid
      end

      it 'It has no filename' do
        upload.filename = ''

        expect(upload).to_not be_valid
      end

      it 'It contains no type' do
        upload.upload_type = ''

        expect(upload).to_not be_valid
      end

      it "It has a type that isn't Site Metadata or Sonobat Output" do
        upload.upload_type = 'FAKE TYPE'

        expect(upload).to_not be_valid
      end
    end
  end
end
