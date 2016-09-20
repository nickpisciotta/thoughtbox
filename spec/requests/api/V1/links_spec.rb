require "rails_helper"

describe "Link Request" do
  describe "Get #index" do
    it "returns array" do
      create_link

      get "/api/v1/links"

      expect(response.status).to eq(200)

      parsed_response = JSON.parse(response.body)

      expect(parsed_response.class).to eq(Array)
    end
  end
end
