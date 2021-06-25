require 'rails_helper'

RSpec.describe "Users::Books", type: :request do
  describe "GET /search" do
    it "returns http success" do
      pending "add some examples (or delete) #{__FILE__}"
      get "/users/books/search"
      expect(response).to have_http_status(:success)
    end
  end

end
