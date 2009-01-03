require File.dirname(__FILE__) + '/../spec_helper'

describe CmsPage do
  before(:each) do
    @cms_page = CmsPage.new({:reference_string => 'test page', :title => 'Test Page'})
  end

  it "should be valid" do
    @cms_page.should be_valid
  end
  
end
