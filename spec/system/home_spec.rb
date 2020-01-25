# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home Flows', type: :system do
  context 'Index' do
    it 'A user can view home page' do
      visit home_index_path

      page_title = find_by_id('home-title')

      expect(page_title).to have_content('Batabase')
    end
  end
end
