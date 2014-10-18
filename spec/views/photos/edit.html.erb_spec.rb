require 'rails_helper'

RSpec.describe "photos/edit", :type => :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :business_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit photo form" do
    render

    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do

      assert_select "input#photo_business_id[name=?]", "photo[business_id]"

      assert_select "input#photo_user_id[name=?]", "photo[user_id]"
    end
  end
end
