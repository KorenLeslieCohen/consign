require "rails_helper"

RSpec.describe NeighborhoodsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/neighborhoods").to route_to("neighborhoods#index")
    end

    it "routes to #new" do
      expect(:get => "/neighborhoods/new").to route_to("neighborhoods#new")
    end

    it "routes to #show" do
      expect(:get => "/neighborhoods/1").to route_to("neighborhoods#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/neighborhoods/1/edit").to route_to("neighborhoods#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/neighborhoods").to route_to("neighborhoods#create")
    end

    it "routes to #update" do
      expect(:put => "/neighborhoods/1").to route_to("neighborhoods#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/neighborhoods/1").to route_to("neighborhoods#destroy", :id => "1")
    end

  end
end
