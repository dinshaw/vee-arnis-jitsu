require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/select_options/index.html.erb" do
  include SelectOptionsHelper
  
  before(:each) do
    
    parent = mock_model(SelectOption)
    parent.should_receive(:display_name).and_return("MyString")
    
    select_option_98 = mock_model(SelectOption)
    select_option_98.should_receive(:display_name).and_return("MyString")
    select_option_98.should_receive(:select_option_value).and_return("MyString")
    select_option_98.should_receive(:parent).twice.and_return(parent)
    select_option_98.should_receive(:description).and_return("MyText")

    select_option_99 = mock_model(SelectOption)
    select_option_99.should_receive(:display_name).and_return("MyString")
    select_option_99.should_receive(:select_option_value).and_return("MyString")
    select_option_99.should_receive(:parent).and_return(nil)    
    select_option_99.should_receive(:description).and_return("MyText")


    assigns[:select_options] = [select_option_98, select_option_99]
  end

  it "should render list of select_options" do
    render "/admin/select_options/index.html.erb"
    response.should have_tag("tr>td", "MyString" )

  end
end

