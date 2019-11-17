require 'rails_helper'

RSpec.describe 'Home Flows', type: :system do
  describe "Index Flows" do
    context 'View Home Page Flow' do
      it 'A user can view home page' do
        visit home_index_path
        
        expect(page).to have_content('Batabase')
      end
    end
  end
end
