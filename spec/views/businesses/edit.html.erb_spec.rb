require 'rails_helper'

RSpec.describe "businesses/edit", :type => :view do
  before(:each) do
    @business = assign(:business, Business.create!(
      :user_id => 1,
      :neighborhood_id => 1,
      :borough_id => 1,
      :name => "MyString",
      :address => "MyText",
      :hours => "MyText",
      :email => "MyString",
      :terms => "MyText"
    ))
  end

  it "renders the edit business form" do
    render

    assert_select "form[action=?][method=?]", business_path(@business), "post" do

      assert_select "input#business_user_id[name=?]", "business[user_id]"

      assert_select "input#business_neighborhood_id[name=?]", "business[neighborhood_id]"

      assert_select "input#business_borough_id[name=?]", "business[borough_id]"

      assert_select "input#business_name[name=?]", "business[name]"

      assert_select "textarea#business_address[name=?]", "business[address]"

      assert_select "textarea#business_hours[name=?]", "business[hours]"

      assert_select "input#business_email[name=?]", "business[email]"

      assert_select "textarea#business_terms[name=?]", "business[terms]"
    end
  end
end
