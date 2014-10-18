require 'rails_helper'

RSpec.describe "neighborhoods/show", :type => :view do
  before(:each) do
    @neighborhood = assign(:neighborhood, Neighborhood.create!(
      :name => "Name",
      :borough_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end
