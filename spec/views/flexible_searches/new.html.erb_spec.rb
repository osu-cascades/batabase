require 'rails_helper'

RSpec.describe "flexible_searches/new", type: :view do
  before(:each) do
    assign(:flexible_search, FlexibleSearch.new(
      name: "MyString"
    ))
  end

  it "renders new flexible_search form" do
    render

    assert_select "form[action=?][method=?]", flexible_searches_path, "post" do

      assert_select "input[name=?]", "flexible_search[name]"
    end
  end
end
