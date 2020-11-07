require 'rails_helper'

RSpec.describe "flexible_searches/edit", type: :view do
  before(:each) do
    @flexible_search = assign(:flexible_search, FlexibleSearch.create!(
      name: "MyString"
    ))
  end

  it "renders the edit flexible_search form" do
    render

    assert_select "form[action=?][method=?]", flexible_search_path(@flexible_search), "post" do

      assert_select "input[name=?]", "flexible_search[name]"
    end
  end
end
