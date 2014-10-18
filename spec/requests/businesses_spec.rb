require 'rails_helper'

RSpec.describe "Businesses", :type => :request do
  describe "GET /businesses" do
    it "works! (now write some real specs)" do
      get businesses_path
      expect(response).to have_http_status(200)
    end
  end
end
