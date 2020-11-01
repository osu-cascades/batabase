require 'rails_helper'

RSpec.describe "location_mappings/index", type: :view do
  before(:each) do
    assign(:location_mappings, [
      LocationMapping.create!(
        name: ""
      ),
      LocationMapping.create!(
        name: ""
      )
    ])
  end

  it "renders a list of location_mappings" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
