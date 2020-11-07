require 'rails_helper'

RSpec.describe "location_mappings/show", type: :view do
  before(:each) do
    @location_mapping = assign(:location_mapping, LocationMapping.create!(
      name: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
