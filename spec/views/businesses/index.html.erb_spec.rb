require 'rails_helper'

RSpec.describe "businesses/index", :type => :view do
  before(:each) do
    assign(:businesses, [
      Business.create!(
        :user_id => 1,
        :neighborhood_id => 2,
        :borough_id => 3,
        :name => "Name",
        :address => "MyText",
        :hours => "MyText",
        :email => "Email",
        :terms => "MyText"
      ),
      Business.create!(
        :user_id => 1,
        :neighborhood_id => 2,
        :borough_id => 3,
        :name => "Name",
        :address => "MyText",
        :hours => "MyText",
        :email => "Email",
        :terms => "MyText"
      )
    ])
  end

  it "renders a list of businesses" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
