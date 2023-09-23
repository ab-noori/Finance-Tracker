require 'rails_helper'

RSpec.describe "Splashes", type: :request do
  describe "GET /index" do
    it "returns a successful response for an authenticated user" do
      user = FactoryBot.create(:user)
      sign_in user
      get root_path
      expect(response).to have_http_status(200)
    end

    it "returns a successful response for an unauthenticated user" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
