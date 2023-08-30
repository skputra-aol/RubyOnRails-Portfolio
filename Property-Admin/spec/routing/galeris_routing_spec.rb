require "rails_helper"

RSpec.describe GalerisController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/galeris").to route_to("galeris#index")
    end

    it "routes to #new" do
      expect(get: "/galeris/new").to route_to("galeris#new")
    end

    it "routes to #show" do
      expect(get: "/galeris/1").to route_to("galeris#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/galeris/1/edit").to route_to("galeris#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/galeris").to route_to("galeris#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/galeris/1").to route_to("galeris#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/galeris/1").to route_to("galeris#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/galeris/1").to route_to("galeris#destroy", id: "1")
    end
  end
end
