require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/emails/index.html.erb" do
  include EmailsHelper
  
  before(:each) do
    email_98 = mock_model(Email)
    email_98.should_receive(:subject).and_return("MyString")
    email_98.should_receive(:body).and_return("MyText")
    email_98.should_receive(:delivered_at).and_return(Time.now)
    email_99 = mock_model(Email)
    email_99.should_receive(:subject).and_return("MyString")
    email_99.should_receive(:body).and_return("MyText")
    email_99.should_receive(:delivered_at).and_return(Time.now)

    assigns[:emails] = [email_98, email_99]
  end

  it "should render list of emails" do
    render "/admin/emails/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end

