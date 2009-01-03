require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/tags/new.html.erb" do
  include TagsHelper
  
  before(:each) do
    @tag = mock_model(Tag)
    @tag.stub!(:new_record?).and_return(true)
    @tag.stub!(:name).and_return("MyString")
    assigns[:tag] = @tag
  end

  it "should render new form" do
    render "/admin/tags/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", admin_tags_path) do
      with_tag("input#tag_name[name=?]", "tag[name]")
    end
  end
end


