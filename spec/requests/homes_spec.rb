require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      pending "add some examples (or delete) #{__FILE__}"
      get "/homes/index"
      expect(response).to have_http_status(:success)
    end
  end

end
