require 'rails_helper'

RSpec.describe 'Upload Flows', type: :system do
  context 'View Uploads Flow' do
    before(:each) do
      create_list(:upload, 3, :meta)
      visit uploads_path
    end

    it 'A user can view all uploads' do
      expect(page).to have_content('FAKE_FILENAME.csv')
    end
  end
end
