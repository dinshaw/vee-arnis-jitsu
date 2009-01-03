require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/select_options/new.html.erb" do
  include SelectOptionsHelper
  
  before(:each) do
    @select_option = mock_model(SelectOption)
    @select_option.stub!(:new_record?).and_return(true)
    @select_option.stub!(:display_name).and_return("MyString")
    @select_option.stub!(:select_option_value).and_return("MyString")
    @select_option.stub!(:parent_id).and_return("1")
    @select_option.stub!(:description).and_return("MyText")
    assigns[:select_option] = @select_option
  end

  it "should render new form" do
    render "/admin/select_options/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", admin_select_options_path) do
      with_tag("input#select_option_display_name[name=?]", "select_option[display_name]")
      with_tag("input#select_option_select_option_value[name=?]", "select_option[select_option_value]")
      with_tag("textarea#select_option_description[name=?]", "select_option[description]")
    end
  end
end


