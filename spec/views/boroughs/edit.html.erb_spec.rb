require 'rails_helper'

RSpec.describe "boroughs/edit", :type => :view do
  before(:each) do
    @borough = assign(:borough, Borough.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit borough form" do
    render

    assert_select "form[action=?][method=?]", borough_path(@borough), "post" do

      assert_select "input#borough_name[name=?]", "borough[name]"
    end
  end
end
