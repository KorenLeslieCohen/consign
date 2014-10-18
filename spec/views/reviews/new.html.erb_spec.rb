require 'rails_helper'

RSpec.describe "reviews/new", :type => :view do
  before(:each) do
    assign(:review, Review.new(
      :business_id => 1,
      :user_id => 1,
      :rating => 1,
      :content => "MyText"
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input#review_business_id[name=?]", "review[business_id]"

      assert_select "input#review_user_id[name=?]", "review[user_id]"

      assert_select "input#review_rating[name=?]", "review[rating]"

      assert_select "textarea#review_content[name=?]", "review[content]"
    end
  end
end
