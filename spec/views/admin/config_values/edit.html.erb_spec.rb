require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/config_values/edit.html.erb" do
  include ConfigValuesHelper
  
  before do
    @config_value = mock_model(ConfigValue)
    @config_value.stub!(:name).and_return("MyString")
    @config_value.stub!(:value).and_return("MyString")
    @config_value.stub!(:sys_var).and_return(false)
    assigns[:config_value] = @config_value
  end

  it "should render edit form" do
    render "/admin/config_values/edit.html.erb"
    
    response.should have_tag("form[action=#{admin_config_value_path(@config_value)}][method=post]") do
      with_tag('input#config_value_name[name=?]', "config_value[name]")
      with_tag('input#config_value_value[name=?]', "config_value[value]")
      with_tag('input#config_value_sys_var[name=?]', "config_value[sys_var]")
    end
  end
end


