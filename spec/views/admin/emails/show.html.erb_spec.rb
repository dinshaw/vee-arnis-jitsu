require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/emails/show.html.erb" do
  include EmailsHelper
  
  before(:each) do
    @email = mock_model(Email)
    @email.stub!(:subject).and_return("MyString")
    @email.stub!(:body).and_return("MyText")
    @email.stub!(:delivered_at).and_return(Time.now)

    assigns[:email] = @email
  end

  it "should render attributes in <p>" do
    render "/admin/emails/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

