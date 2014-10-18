require 'rails_helper'

RSpec.describe "reviews/show", :type => :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :business_id => 1,
      :user_id => 2,
      :rating => 3,
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
  end
end
