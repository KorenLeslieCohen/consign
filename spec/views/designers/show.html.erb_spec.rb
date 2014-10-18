require 'rails_helper'

RSpec.describe "designers/show", :type => :view do
  before(:each) do
    @designer = assign(:designer, Designer.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
