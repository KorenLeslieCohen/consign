require 'rails_helper'

RSpec.describe "neighborhoods/index", :type => :view do
  before(:each) do
    assign(:neighborhoods, [
      Neighborhood.create!(
        :name => "Name",
        :borough_id => 1
      ),
      Neighborhood.create!(
        :name => "Name",
        :borough_id => 1
      )
    ])
  end

  it "renders a list of neighborhoods" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
