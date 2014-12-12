require 'rails_helper'

RSpec.describe "messages/index", :type => :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :name => "Name",
        :email => "Email",
        :body => "MyText"
      ),
      Message.create!(
        :name => "Name",
        :email => "Email",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
