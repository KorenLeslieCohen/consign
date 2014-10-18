require 'rails_helper'

RSpec.describe "businesses/show", :type => :view do
  before(:each) do
    @business = assign(:business, Business.create!(
      :user_id => 1,
      :neighborhood_id => 2,
      :borough_id => 3,
      :name => "Name",
      :address => "MyText",
      :hours => "MyText",
      :email => "Email",
      :terms => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
  end
end
