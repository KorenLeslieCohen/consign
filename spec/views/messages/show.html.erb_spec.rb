require 'rails_helper'

RSpec.describe "messages/show", :type => :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :name => "Name",
      :email => "Email",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
  end
end
