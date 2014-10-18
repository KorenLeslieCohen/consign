require "rails_helper"

RSpec.describe BoroughsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/boroughs").to route_to("boroughs#index")
    end

    it "routes to #new" do
      expect(:get => "/boroughs/new").to route_to("boroughs#new")
    end

    it "routes to #show" do
      expect(:get => "/boroughs/1").to route_to("boroughs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/boroughs/1/edit").to route_to("boroughs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/boroughs").to route_to("boroughs#create")
    end

    it "routes to #update" do
      expect(:put => "/boroughs/1").to route_to("boroughs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/boroughs/1").to route_to("boroughs#destroy", :id => "1")
    end

  end
end
