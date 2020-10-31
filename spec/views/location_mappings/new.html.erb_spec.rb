require 'rails_helper'

RSpec.describe "location_mappings/new", type: :view do
  before(:each) do
    assign(:location_mapping, LocationMapping.new(
      name: "",
      score: ""
    ))
  end

  it "renders new location_mapping form" do
    render

    assert_select "form[action=?][method=?]", location_mappings_path, "post" do

      assert_select "input[name=?]", "location_mapping[name]"

      assert_select "input[name=?]", "location_mapping[score]"
    end
  end
end
