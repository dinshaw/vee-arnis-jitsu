require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/emails/edit.html.erb" do
  include EmailsHelper
  
  before do
    @email = mock_model(Email)
    @email.stub!(:subject).and_return("MyString")
    @email.stub!(:body).and_return("MyText")
    @email.stub!(:delivered_at).and_return(Time.now)
    assigns[:email] = @email
  end

  it "should render edit form" do
    render "/admin/emails/edit.html.erb"
    
    response.should have_tag("form[action=#{admin_email_path(@email)}][method=post]") do
      with_tag('input#email_subject[name=?]', "email[subject]")
      with_tag('textarea#email_body[name=?]', "email[body]")
    end
  end
end


