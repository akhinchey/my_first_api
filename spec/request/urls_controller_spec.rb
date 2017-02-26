require "rails_helper"
require "airborne"

RSpec.describe "UrlsController", :type => :request do

  describe "GET /urls" do
    it "gets all currently stored urls in JSON format" do
      headers = {
        "ACCEPT" => "application/json"
      }
      get "http://localhost:3000/api/v1/urls", headers: headers

      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /urls" do
    it "stores valid urls in JSON format" do
      headers = {
          "ACCEPT" => "application/json"
      }
      post "http://localhost:3000/api/v1/urls", params: { :url => {:name => "https://www.nytimes.com/"} }, headers:headers

      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:ok)
    end
  end

end


