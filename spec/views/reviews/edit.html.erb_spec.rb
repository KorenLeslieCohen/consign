require 'rails_helper'

RSpec.describe "reviews/edit", :type => :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :business_id => 1,
      :user_id => 1,
      :rating => 1,
      :content => "MyText"
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input#review_business_id[name=?]", "review[business_id]"

      assert_select "input#review_user_id[name=?]", "review[user_id]"

      assert_select "input#review_rating[name=?]", "review[rating]"

      assert_select "textarea#review_content[name=?]", "review[content]"
    end
  end
end
