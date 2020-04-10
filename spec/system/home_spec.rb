# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home Flows', type: :system do
  let(:user) { FactoryBot.create(:user) }

  context 'Index' do
    it 'A non signed in user user cannot view home page' do
      visit home_index_path

      expect(current_path).not_to eq(home_index_path)
    end

    it 'A signed in user user can view home page' do
      sign_in user
      visit home_index_path

      expect(current_path).to eq(home_index_path)
    end
  end
end
