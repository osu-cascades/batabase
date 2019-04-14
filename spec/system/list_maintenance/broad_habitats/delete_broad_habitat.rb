require 'rails_helper'

RSpec.describe BroadHabitat, type: :system do
  include Devise::Test::IntegrationHelpers

  let(:user) { create(:user, :confirmed) }
  let(:broad_habitat) { create(:broad_habitat) }

  before do
    sign_in(user)
    visit(broad_habitats_path(broad_habitat.id))
  end

  describe 'deleting a broad habitat' do
    it 'is successful' do
      find(:css, '.fa-trash-alt').click
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content('Broad habitat was successfully destroyed.')
    end
  end
end
