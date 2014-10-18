require "rails_helper"

RSpec.describe BusinessesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/businesses").to route_to("businesses#index")
    end

    it "routes to #new" do
      expect(:get => "/businesses/new").to route_to("businesses#new")
    end

    it "routes to #show" do
      expect(:get => "/businesses/1").to route_to("businesses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/businesses/1/edit").to route_to("businesses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/businesses").to route_to("businesses#create")
    end

    it "routes to #update" do
      expect(:put => "/businesses/1").to route_to("businesses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/businesses/1").to route_to("businesses#destroy", :id => "1")
    end

  end
end
