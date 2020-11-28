require 'rails_helper'

RSpec.describe "flexible_searches/index", type: :view do
  before(:each) do
    assign(:flexible_searches, [
      FlexibleSearch.create!(
        name: "Name"
      ),
      FlexibleSearch.create!(
        name: "Name"
      )
    ])
  end

#   it "renders a list of flexible_searches" do
#     render
#     assert_select "tr>td", text: "Name".to_s, count: 2
#   end
# end
