require 'rails_helper'

RSpec.describe "Boroughs", :type => :request do
  describe "GET /boroughs" do
    it "works! (now write some real specs)" do
      get boroughs_path
      expect(response).to have_http_status(200)
    end
  end
end
