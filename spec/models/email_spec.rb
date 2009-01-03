require File.dirname(__FILE__) + '/../spec_helper'

describe Email do

  it "should not be valid" do
    @email = Email.new
    @email.should_not be_valid
  end
  
  it "should be valid" do
    @email = Email.new(:subject => "Subject", :body => "Text")
    @email.should be_valid
  end
  
end


