require 'rails_helper'

RSpec.describe "photos/index", :type => :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        :business_id => 1,
        :user_id => 2
      ),
      Photo.create!(
        :business_id => 1,
        :user_id => 2
      )
    ])
  end

  it "renders a list of photos" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
