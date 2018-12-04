require 'rails_helper'

RSpec.describe BroadHabitat, type: :system do
  include Devise::Test::IntegrationHelpers

  let(:user) { create(:user, :confirmed) }
  let(:broad_habitat) { create(:broad_habitat) }

  before do
    sign_in(user)
    visit(edit_broad_habitat_path(broad_habitat.id))
  end

  describe 'editing a broad habitat' do
    it 'is successful with valid attributes' do
      fill_in('Label', with: 'New Label')
      click_on('Update Broad habitat')
      expect(page).to have_content('Broad habitat was successfully updated.')
    end

    it 'is unsuccessful without valid attributes' do
      fill_in('Label', with: '')
      click_on('Update Broad habitat')
      expect(page).to have_selector '.alert', text: 'The form contains 1 error.'
      page.find('#error-explanation').tap do |error_explanations|
        expect(error_explanations).to have_content("Label can't be blank")
      end
    end
  end
end
