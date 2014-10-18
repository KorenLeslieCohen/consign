require 'rails_helper'

RSpec.describe "photos/show", :type => :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :business_id => 1,
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
