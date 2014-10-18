require 'rails_helper'

RSpec.describe "boroughs/index", :type => :view do
  before(:each) do
    assign(:boroughs, [
      Borough.create!(
        :name => "Name"
      ),
      Borough.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of boroughs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
