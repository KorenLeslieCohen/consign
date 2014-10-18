require 'rails_helper'

RSpec.describe "biztags/show", :type => :view do
  before(:each) do
    @biztag = assign(:biztag, Biztag.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
