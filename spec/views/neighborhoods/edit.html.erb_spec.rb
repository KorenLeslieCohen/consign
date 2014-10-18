require 'rails_helper'

RSpec.describe "neighborhoods/edit", :type => :view do
  before(:each) do
    @neighborhood = assign(:neighborhood, Neighborhood.create!(
      :name => "MyString",
      :borough_id => 1
    ))
  end

  it "renders the edit neighborhood form" do
    render

    assert_select "form[action=?][method=?]", neighborhood_path(@neighborhood), "post" do

      assert_select "input#neighborhood_name[name=?]", "neighborhood[name]"

      assert_select "input#neighborhood_borough_id[name=?]", "neighborhood[borough_id]"
    end
  end
end
