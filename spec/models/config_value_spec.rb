require File.dirname(__FILE__) + '/../spec_helper'

describe ConfigValue do
  before(:each) do
    @config_value = ConfigValue.new(:name => "Test", :value => "Value")
  end

  it "should be valid" do
    @config_value.should be_valid
  end
end
