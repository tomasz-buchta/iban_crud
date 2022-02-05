require "rails_helper"

RSpec.describe IbansController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ibans").to route_to("ibans#index")
    end

    it "routes to #show" do
      expect(get: "/ibans/1").to route_to("ibans#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/ibans").to route_to("ibans#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/ibans/1").to route_to("ibans#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/ibans/1").to route_to("ibans#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/ibans/1").to route_to("ibans#destroy", id: "1")
    end
  end
end

