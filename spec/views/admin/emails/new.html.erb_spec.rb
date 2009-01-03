require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/emails/new.html.erb" do
  include EmailsHelper
  
  before(:each) do
    @email = mock_model(Email)
    @email.stub!(:new_record?).and_return(true)
    @email.stub!(:subject).and_return("MyString")
    @email.stub!(:body).and_return("MyText")
    @email.stub!(:delivered_at).and_return(Time.now)
    assigns[:email] = @email
  end

  it "should render new form" do
    render "/admin/emails/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", admin_emails_path) do
      with_tag("input#email_subject[name=?]", "email[subject]")
      with_tag("textarea#email_body[name=?]", "email[body]")
    end
  end
end


