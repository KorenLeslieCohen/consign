require 'rails_helper'

RSpec.describe "designers/new", :type => :view do
  before(:each) do
    assign(:designer, Designer.new(
      :name => "MyString"
    ))
  end

  it "renders new designer form" do
    render

    assert_select "form[action=?][method=?]", designers_path, "post" do

      assert_select "input#designer_name[name=?]", "designer[name]"
    end
  end
end
