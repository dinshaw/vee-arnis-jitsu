require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/config_values/index.html.erb" do
  include ConfigValuesHelper
  
  before(:each) do
    config_value_98 = mock_model(ConfigValue)
    config_value_98.should_receive(:name).and_return("MyString")
    config_value_98.should_receive(:value).and_return("MyString")
    config_value_98.should_receive(:sys_var).and_return(false)
    config_value_99 = mock_model(ConfigValue)
    config_value_99.should_receive(:name).and_return("MyString")
    config_value_99.should_receive(:value).and_return("MyString")
    config_value_99.should_receive(:sys_var).and_return(true)

    assigns[:config_values] = [config_value_98, config_value_99]
  end

  it "should render list of config_values" do
    render "/admin/config_values/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "Yes",1)
    response.should have_tag("tr>td", "No", 1)  
  end
end

