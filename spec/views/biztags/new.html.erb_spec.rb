require 'rails_helper'

RSpec.describe "biztags/new", :type => :view do
  before(:each) do
    assign(:biztag, Biztag.new(
      :name => "MyString"
    ))
  end

  it "renders new biztag form" do
    render

    assert_select "form[action=?][method=?]", biztags_path, "post" do

      assert_select "input#biztag_name[name=?]", "biztag[name]"
    end
  end
end
