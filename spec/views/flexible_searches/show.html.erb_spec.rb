require 'rails_helper'

RSpec.describe "flexible_searches/show", type: :view do
  before(:each) do
    @flexible_search = assign(:flexible_search, FlexibleSearch.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
