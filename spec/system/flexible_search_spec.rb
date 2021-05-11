require 'rails_helper'

RSpec.describe FlexibleSearch, type: :system do
  let(:user) { FactoryBot.create(:user) }

  context 'FlexibleSearches' do
    before :each do
      sign_in user
      create(:flexible_search)
    end

    it 'A user can visit the page to view all the flexible searches' do
      visit home_index_path
      click_on 'Custom Search'

      expect(page).to have_content('Quick Search')
    end

    # it 'A user can visit the page to add new flexible search' do
    #   visit home_index_path
    #   click_on 'Custom Search'
    #   click_on 'Search #1'

    #   expect(page).to have_content('Search Results')
    # end
  end
end
