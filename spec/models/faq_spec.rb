require File.dirname(__FILE__) + '/../spec_helper'

describe Faq do
  before(:each) do
    @faq = Faq.new(:question => "test", :answer => "answer")
  end

  it "should be valid" do
    @faq.should be_valid
  end
end
