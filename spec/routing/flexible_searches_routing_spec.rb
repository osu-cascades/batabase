require "rails_helper"

RSpec.describe FlexibleSearchesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/flexible_searches").to route_to("flexible_searches#index")
    end

    it "routes to #new" do
      expect(get: "/flexible_searches/new").to route_to("flexible_searches#new")
    end

    it "routes to #show" do
      expect(get: "/flexible_searches/1").to route_to("flexible_searches#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/flexible_searches/1/edit").to route_to("flexible_searches#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/flexible_searches").to route_to("flexible_searches#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/flexible_searches/1").to route_to("flexible_searches#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/flexible_searches/1").to route_to("flexible_searches#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/flexible_searches/1").to route_to("flexible_searches#destroy", id: "1")
    end
  end
end
