require "rails_helper"

RSpec.describe BiztagsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/biztags").to route_to("biztags#index")
    end

    it "routes to #new" do
      expect(:get => "/biztags/new").to route_to("biztags#new")
    end

    it "routes to #show" do
      expect(:get => "/biztags/1").to route_to("biztags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/biztags/1/edit").to route_to("biztags#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/biztags").to route_to("biztags#create")
    end

    it "routes to #update" do
      expect(:put => "/biztags/1").to route_to("biztags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/biztags/1").to route_to("biztags#destroy", :id => "1")
    end

  end
end
