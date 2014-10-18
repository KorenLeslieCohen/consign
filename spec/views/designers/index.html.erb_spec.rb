require 'rails_helper'

RSpec.describe "designers/index", :type => :view do
  before(:each) do
    assign(:designers, [
      Designer.create!(
        :name => "Name"
      ),
      Designer.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of designers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
