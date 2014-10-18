require 'rails_helper'

RSpec.describe "Biztags", :type => :request do
  describe "GET /biztags" do
    it "works! (now write some real specs)" do
      get biztags_path
      expect(response).to have_http_status(200)
    end
  end
end
