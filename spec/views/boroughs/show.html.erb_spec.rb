require 'rails_helper'

RSpec.describe "boroughs/show", :type => :view do
  before(:each) do
    @borough = assign(:borough, Borough.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
