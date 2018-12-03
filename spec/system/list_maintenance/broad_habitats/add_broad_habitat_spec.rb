require 'rails_helper'

RSpec.describe BroadHabitat, type: :system do
  include Devise::Test::IntegrationHelpers

  let(:user) { create(:user, :confirmed) }

  before do
    sign_in(user)
    visit(new_broad_habitat_path)
  end

  describe 'adding a broad habitat' do
    it 'is successful with valid attributes' do
      fill_in('Label', with: 'Example Label')
      click_on('Create Broad habitat')
      expect(page).to have_content('Broad habitat was successfully created.')
    end

    it 'is unsuccessful without valid attributes' do
      click_on('Create Broad habitat')
      expect(page).to have_selector '.alert', text: 'The form contains 1 error.'
      page.find('#error-explanation').tap do |error_explanations|
        expect(error_explanations).to have_content("Label can't be blank")
      end
    end
  end
end
