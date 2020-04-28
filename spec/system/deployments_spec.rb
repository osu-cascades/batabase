# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Deployments Flow', type: :system do
  let(:user) { FactoryBot.create(:user) }

  context 'Deployments' do
    before :each do
      sign_in user
    end

    it 'A user can visit the page to view all the deployments' do
      visit deployments_path
      expect(page).to have_css('table.deployments_grid')
    end

    it 'A user can visit the page to add new deployments' do
      visit deployments_path
      find('a', text: 'Add Deployment').click
      
      expect(page).to have_content('Create Deployment')
    end

  end
end