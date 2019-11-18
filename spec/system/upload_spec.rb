require 'rails_helper'

GENERATED_UPLOAD_COUNT = 3

RSpec.describe 'Upload Flows', type: :system do
  context 'Index' do
    before :each do
      create_list(:upload, GENERATED_UPLOAD_COUNT, :meta)
      visit uploads_path
    end

    it 'A user can view all uploads' do
      1.upto(GENERATED_UPLOAD_COUNT) { |i| expect(page).to have_content("FAKE_FILENAME_#{i}.csv") }
    end

    it 'A user can click to view the data of an upload', js:true do
      first('a', text: 'View Upload').click

      expect(page).to have_content("FAKE_FILENAME_1.csv")
    end

    it 'A user can click to delete an upload', js:true do
      expect(page).to have_content("FAKE_FILENAME_1.csv")

      first('form').click

      expect(page).to_not have_content("FAKE_FILENAME_1.csv")
    end

    it 'A user can click to navigate to new upload page', js:true do
      find('a', text: 'Add Upload').click

      expect(page).to_not have_content("FAKE_FILENAME_1.csv")
    end
  end

  context "New" do
    before :each do
      visit new_upload_path
    end
    
    it 'A user successfully uploads a csv file' do
      select('Site Metadata', from: 'Upload type')
      attach_file('Data', 'spec/fixtures/meta_upload.csv')
      click_button 'Upload CSV'

      expect(page).to have_content("Commit Upload")
    end

    it 'A user unsuccessfully attempts to upload a csv file' do
      select('Site Metadata', from: 'Upload type')
      attach_file('Data', 'spec/fixtures/empty_upload.csv')
      click_button 'Upload CSV'

      expect(page).to have_content("File must contain data")
    end

    # TODO: fix the form and how it's validation works
    # TODO: add test to verify file name is reflected and add that to how the form works to make it pass
    # TODO: change this test to check for the error message for a miss named file
    it "A user unsuccessfully attempts to upload a file that isn't a csv" do
      select('Site Metadata', from: 'Upload type')
      attach_file('Data', 'spec/fixtures/bad_upload.sbeav')
      click_button 'Upload CSV'

      expect(page).to have_content("Import CSV Data")
    end
  end
end
