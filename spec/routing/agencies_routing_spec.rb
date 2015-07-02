require "rails_helper"

RSpec.describe Api::AgenciesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/api/agencies").to route_to("api/agencies#index", format: :json)
    end

    it "routes to #create" do
      expect(post: "/api/agencies").to route_to("api/agencies#create", format: :json)
    end

  end
end
