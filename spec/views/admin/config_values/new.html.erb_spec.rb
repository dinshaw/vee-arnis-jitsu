require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/config_values/new.html.erb" do
  include ConfigValuesHelper
  
  before(:each) do
    @config_value = mock_model(ConfigValue)
    @config_value.stub!(:new_record?).and_return(true)
    @config_value.stub!(:name).and_return("MyString")
    @config_value.stub!(:value).and_return("MyString")
    @config_value.stub!(:sys_var).and_return(false)
    assigns[:config_value] = @config_value
  end

  it "should render new form" do
    render "/admin/config_values/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", admin_config_values_path) do
      with_tag("input#config_value_name[name=?]", "config_value[name]")
      with_tag("input#config_value_value[name=?]", "config_value[value]")
      with_tag("input#config_value_sys_var[name=?]", "config_value[sys_var]")
    end
  end
end


