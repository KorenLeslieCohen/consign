require 'rails_helper'

RSpec.describe "Designers", :type => :request do
  describe "GET /designers" do
    it "works! (now write some real specs)" do
      get designers_path
      expect(response).to have_http_status(200)
    end
  end
end
