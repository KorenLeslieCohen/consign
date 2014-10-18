require 'rails_helper'

RSpec.describe "designers/edit", :type => :view do
  before(:each) do
    @designer = assign(:designer, Designer.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit designer form" do
    render

    assert_select "form[action=?][method=?]", designer_path(@designer), "post" do

      assert_select "input#designer_name[name=?]", "designer[name]"
    end
  end
end
