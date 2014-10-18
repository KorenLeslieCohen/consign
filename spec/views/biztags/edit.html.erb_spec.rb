require 'rails_helper'

RSpec.describe "biztags/edit", :type => :view do
  before(:each) do
    @biztag = assign(:biztag, Biztag.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit biztag form" do
    render

    assert_select "form[action=?][method=?]", biztag_path(@biztag), "post" do

      assert_select "input#biztag_name[name=?]", "biztag[name]"
    end
  end
end
