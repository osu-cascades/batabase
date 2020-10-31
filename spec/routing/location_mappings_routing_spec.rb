require "rails_helper"

RSpec.describe LocationMappingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/location_mappings").to route_to("location_mappings#index")
    end

    it "routes to #new" do
      expect(get: "/location_mappings/new").to route_to("location_mappings#new")
    end

    it "routes to #show" do
      expect(get: "/location_mappings/1").to route_to("location_mappings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/location_mappings/1/edit").to route_to("location_mappings#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/location_mappings").to route_to("location_mappings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/location_mappings/1").to route_to("location_mappings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/location_mappings/1").to route_to("location_mappings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/location_mappings/1").to route_to("location_mappings#destroy", id: "1")
    end
  end
end
