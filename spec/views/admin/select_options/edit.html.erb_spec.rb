require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/select_options/edit.html.erb" do
  include SelectOptionsHelper
  
  before do
    @select_option = mock_model(SelectOption)
    @select_option.stub!(:display_name).and_return("MyString")
    @select_option.stub!(:select_option_value).and_return("MyString")
    @select_option.stub!(:parent_id).and_return("1")
    @select_option.stub!(:description).and_return("MyText")
    assigns[:select_option] = @select_option
  end

  it "should render edit form" do
    render "/admin/select_options/edit.html.erb"
    
    response.should have_tag("form[action=#{admin_select_option_path(@select_option)}][method=post]") do
      with_tag('input#select_option_display_name[name=?]', "select_option[display_name]")
      with_tag('input#select_option_select_option_value[name=?]', "select_option[select_option_value]")
      with_tag('textarea#select_option_description[name=?]', "select_option[description]")
    end
  end
end


