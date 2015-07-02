require 'rails_helper'

RSpec.describe "Agencies", type: :request do
  describe "GET /api/agencies" do
    it "responds with status 200" do
      get api_agencies_path
      expect(response).to have_http_status(200)
    end
  end
  describe "POST /api/agencies" do
    it "responds with status 201" do
      post api_agencies_path, agency: {name: 'Valid', grade: 'padawan'}
      expect(response).to have_http_status(201)
    end
  end
end
