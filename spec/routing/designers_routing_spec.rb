require "rails_helper"

RSpec.describe DesignersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/designers").to route_to("designers#index")
    end

    it "routes to #new" do
      expect(:get => "/designers/new").to route_to("designers#new")
    end

    it "routes to #show" do
      expect(:get => "/designers/1").to route_to("designers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/designers/1/edit").to route_to("designers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/designers").to route_to("designers#create")
    end

    it "routes to #update" do
      expect(:put => "/designers/1").to route_to("designers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/designers/1").to route_to("designers#destroy", :id => "1")
    end

  end
end
