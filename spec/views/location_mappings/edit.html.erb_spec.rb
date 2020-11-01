require 'rails_helper'

RSpec.describe "location_mappings/edit", type: :view do
  before(:each) do
    @location_mapping = assign(:location_mapping, LocationMapping.create!(
      name: ""
    ))
  end

  it "renders the edit location_mapping form" do
    render

    assert_select "form[action=?][method=?]", location_mapping_path(@location_mapping), "post" do

      assert_select "input[name=?]", "location_mapping[name]"

    end
  end
end
