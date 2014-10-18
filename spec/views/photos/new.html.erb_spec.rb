require 'rails_helper'

RSpec.describe "photos/new", :type => :view do
  before(:each) do
    assign(:photo, Photo.new(
      :business_id => 1,
      :user_id => 1
    ))
  end

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do

      assert_select "input#photo_business_id[name=?]", "photo[business_id]"

      assert_select "input#photo_user_id[name=?]", "photo[user_id]"
    end
  end
end
