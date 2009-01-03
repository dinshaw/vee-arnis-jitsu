require File.dirname(__FILE__) + '/../spec_helper'

describe FaqCategory do
  before(:each) do
    @faq_category = FaqCategory.new(:title => "test")
  end

  it "should be valid" do
    @faq_category.should be_valid
  end
end
