require 'rails_helper'

RSpec.describe "Users::Users", type: :request do
  describe "GET /show" do
    it "returns http success" do
      pending "add some examples (or delete) #{__FILE__}"
      get "/users/users/show"
      expect(response).to have_http_status(:success)
    end
  end

end
