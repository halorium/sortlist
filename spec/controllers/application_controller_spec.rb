require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    # context 'when format is html' do
    #   it "renders the index template with layout" do
    #     get :index, format: 'html'
    #     expect(response).to render_template("index")
    #   end
    # end
    # context 'when format is not html' do
    #   it "renders the index template without layout" do
    #     get :index, format: 'json'
    #     expect(response).to render_template("index")
    #   end
    # end
  end
end
