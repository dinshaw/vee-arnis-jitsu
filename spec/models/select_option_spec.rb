require File.dirname(__FILE__) + '/../spec_helper'

describe SelectOption do
  before(:each) do
    @select_option = SelectOption.new
  end

  it "should be valid" do
    @select_option.should be_valid
  end
end
