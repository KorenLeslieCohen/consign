require 'rails_helper'

RSpec.describe "biztags/index", :type => :view do
  before(:each) do
    assign(:biztags, [
      Biztag.create!(
        :name => "Name"
      ),
      Biztag.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of biztags" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
