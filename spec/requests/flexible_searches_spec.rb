 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/flexible_searches", type: :request do
  # FlexibleSearch. As you add validations to FlexibleSearch, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      FlexibleSearch.create! valid_attributes
      get flexible_searches_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      flexible_search = FlexibleSearch.create! valid_attributes
      get flexible_search_url(flexible_search)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    # it "renders a successful response" do
    #   get new_flexible_search_url
    #   expect(response).to be_successful
    # end
  end

  describe "GET /edit" do
    it "render a successful response" do
      flexible_search = FlexibleSearch.create! valid_attributes
      get edit_flexible_search_url(flexible_search)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    # context "with valid parameters" do
    #   it "creates a new FlexibleSearch" do
    #     expect {
    #       post flexible_searches_url, params: { flexible_search: valid_attributes }
    #     }.to change(FlexibleSearch, :count).by(1)
    #   end

    #   it "redirects to the created flexible_search" do
    #     post flexible_searches_url, params: { flexible_search: valid_attributes }
    #     expect(response).to redirect_to(flexible_search_url(FlexibleSearch.last))
    #   end
    # end

    # context "with invalid parameters" do
    #   it "does not create a new FlexibleSearch" do
    #     expect {
    #       post flexible_searches_url, params: { flexible_search: invalid_attributes }
    #     }.to change(FlexibleSearch, :count).by(0)
    #   end

    #   it "renders a successful response (i.e. to display the 'new' template)" do
    #     post flexible_searches_url, params: { flexible_search: invalid_attributes }
    #     expect(response).to be_successful
    #   end
    # end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested flexible_search" do
        flexible_search = FlexibleSearch.create! valid_attributes
        patch flexible_search_url(flexible_search), params: { flexible_search: new_attributes }
        flexible_search.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the flexible_search" do
        flexible_search = FlexibleSearch.create! valid_attributes
        patch flexible_search_url(flexible_search), params: { flexible_search: new_attributes }
        flexible_search.reload
        expect(response).to redirect_to(flexible_search_url(flexible_search))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        flexible_search = FlexibleSearch.create! valid_attributes
        patch flexible_search_url(flexible_search), params: { flexible_search: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested flexible_search" do
      flexible_search = FlexibleSearch.create! valid_attributes
      expect {
        delete flexible_search_url(flexible_search)
      }.to change(FlexibleSearch, :count).by(-1)
    end

    it "redirects to the flexible_searches list" do
      flexible_search = FlexibleSearch.create! valid_attributes
      delete flexible_search_url(flexible_search)
      expect(response).to redirect_to(flexible_searches_url)
    end
  end
end
