require 'rails_helper'

RSpec.describe "neighborhoods/new", :type => :view do
  before(:each) do
    assign(:neighborhood, Neighborhood.new(
      :name => "MyString",
      :borough_id => 1
    ))
  end

  it "renders new neighborhood form" do
    render

    assert_select "form[action=?][method=?]", neighborhoods_path, "post" do

      assert_select "input#neighborhood_name[name=?]", "neighborhood[name]"

      assert_select "input#neighborhood_borough_id[name=?]", "neighborhood[borough_id]"
    end
  end
end
