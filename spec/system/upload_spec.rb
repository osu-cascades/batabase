require 'rails_helper'

GENERATED_UPLOAD_COUNT = 3

RSpec.describe 'Upload Flows', type: :system, js: true do
  describe "Index Flows" do
    context 'View Uploads' do
      before(:each) do
        create_list(:upload, GENERATED_UPLOAD_COUNT, :meta)
        visit uploads_path
      end

      it 'A user can view all uploads' do
        1.upto(GENERATED_UPLOAD_COUNT) { |i| expect(page).to have_content("FAKE_FILENAME_#{i}.csv") }
      end

      it 'A user can click to view an uploads data' do
        first('a', text: 'View Upload').click

        expect(page).to have_content("FAKE_FILENAME_1.csv")
      end
    end
  end

  describe "New Flow" do
    
  end
end
