require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::CmsPagesController do
  describe "route generation" do

    it "should map { :controller => 'admin/cms_pages', :action => 'index' } to /pages" do
      route_for(:controller => "admin/cms_pages", :action => "index").should == "/admin/cms_pages"
    end
  
    it "should map { :controller => 'admin/cms_pages', :action => 'new' } to /pages/new" do
      route_for(:controller => "admin/cms_pages", :action => "new").should == "/admin/cms_pages/new"
    end
  
    it "should map { :controller => 'admin/cms_pages', :action => 'show', :id => 1 } to /pages/1" do
      route_for(:controller => "admin/cms_pages", :action => "show", :id => 1).should == "/admin/cms_pages/1"
    end
  
    it "should map { :controller => 'admin/cms_pages', :action => 'edit', :id => 1 } to /pages/1/edit" do
      route_for(:controller => "admin/cms_pages", :action => "edit", :id => 1).should == "/admin/cms_pages/1/edit"
    end
  
    it "should map { :controller => 'admin/cms_pages', :action => 'update', :id => 1} to /pages/1" do
      route_for(:controller => "admin/cms_pages", :action => "update", :id => 1).should == "/admin/cms_pages/1"
    end
  
    it "should map { :controller => 'admin/cms_pages', :action => 'destroy', :id => 1} to /pages/1" do
      route_for(:controller => "admin/cms_pages", :action => "destroy", :id => 1).should == "/admin/cms_pages/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'admin/cms_pages', action => 'index' } from GET /pages" do
      params_from(:get, "/admin/cms_pages").should == {:controller => "admin/cms_pages", :action => "index"}
    end
  
    it "should generate params { :controller => 'admin/cms_pages', action => 'new' } from GET /pages/new" do
      params_from(:get, "/admin/cms_pages/new").should == {:controller => "admin/cms_pages", :action => "new"}
    end
  
    it "should generate params { :controller => 'admin/cms_pages', action => 'create' } from POST /pages" do
      params_from(:post, "/admin/cms_pages").should == {:controller => "admin/cms_pages", :action => "create"}
    end
  
    it "should generate params { :controller => 'admin/cms_pages', action => 'show', id => '1' } from GET /pages/1" do
      params_from(:get, "/admin/cms_pages/1").should == {:controller => "admin/cms_pages", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/cms_pages', action => 'edit', id => '1' } from GET /pages/1;edit" do
      params_from(:get, "/admin/cms_pages/1/edit").should == {:controller => "admin/cms_pages", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/cms_pages', action => 'update', id => '1' } from PUT /pages/1" do
      params_from(:put, "/admin/cms_pages/1").should == {:controller => "admin/cms_pages", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/cms_pages', action => 'destroy', id => '1' } from DELETE /pages/1" do
      params_from(:delete, "/admin/cms_pages/1").should == {:controller => "admin/cms_pages", :action => "destroy", :id => "1"}
    end
  end
end