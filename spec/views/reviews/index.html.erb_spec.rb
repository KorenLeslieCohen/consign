require 'rails_helper'

RSpec.describe "reviews/index", :type => :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        :business_id => 1,
        :user_id => 2,
        :rating => 3,
        :content => "MyText"
      ),
      Review.create!(
        :business_id => 1,
        :user_id => 2,
        :rating => 3,
        :content => "MyText"
      )
    ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
