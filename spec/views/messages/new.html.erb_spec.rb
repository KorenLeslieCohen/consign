require 'rails_helper'

RSpec.describe "messages/new", :type => :view do
  before(:each) do
    assign(:message, Message.new(
      :name => "MyString",
      :email => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "input#message_name[name=?]", "message[name]"

      assert_select "input#message_email[name=?]", "message[email]"

      assert_select "textarea#message_body[name=?]", "message[body]"
    end
  end
end
