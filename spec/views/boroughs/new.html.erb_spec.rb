require 'rails_helper'

RSpec.describe "boroughs/new", :type => :view do
  before(:each) do
    assign(:borough, Borough.new(
      :name => "MyString"
    ))
  end

  it "renders new borough form" do
    render

    assert_select "form[action=?][method=?]", boroughs_path, "post" do

      assert_select "input#borough_name[name=?]", "borough[name]"
    end
  end
end
