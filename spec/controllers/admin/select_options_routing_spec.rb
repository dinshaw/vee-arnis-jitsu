require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::SelectOptionsController do
  before(:each) do
    do_login
  end
  describe "route generation" do

    it "should map { :controller => 'admin/select_options', :action => 'index' } to /admin/select_options" do
      route_for(:controller => "admin/select_options", :action => "index").should == "/admin/select_options"
    end
  
    it "should map { :controller => 'admin/select_options', :action => 'new' } to /admin/select_options/new" do
      route_for(:controller => "admin/select_options", :action => "new").should == "/admin/select_options/new"
    end
  
    it "should map { :controller => 'admin/select_options', :action => 'show', :id => 1 } to /admin/select_options/1" do
      route_for(:controller => "admin/select_options", :action => "show", :id => 1).should == "/admin/select_options/1"
    end
  
    it "should map { :controller => 'admin/select_options', :action => 'edit', :id => 1 } to /admin/select_options/1/edit" do
      route_for(:controller => "admin/select_options", :action => "edit", :id => 1).should == "/admin/select_options/1/edit"
    end
  
    it "should map { :controller => 'admin/select_options', :action => 'update', :id => 1} to /admin/select_options/1" do
      route_for(:controller => "admin/select_options", :action => "update", :id => 1).should == "/admin/select_options/1"
    end
  
    it "should map { :controller => 'admin/select_options', :action => 'destroy', :id => 1} to /admin/select_options/1" do
      route_for(:controller => "admin/select_options", :action => "destroy", :id => 1).should == "/admin/select_options/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'admin/select_options', action => 'index' } from GET /admin/select_options" do
      params_from(:get, "/admin/select_options").should == {:controller => "admin/select_options", :action => "index"}
    end
  
    it "should generate params { :controller => 'admin/select_options', action => 'new' } from GET /admin/select_options/new" do
      params_from(:get, "/admin/select_options/new").should == {:controller => "admin/select_options", :action => "new"}
    end
  
    it "should generate params { :controller => 'admin/select_options', action => 'create' } from POST /admin/select_options" do
      params_from(:post, "/admin/select_options").should == {:controller => "admin/select_options", :action => "create"}
    end
  
    it "should generate params { :controller => 'admin/select_options', action => 'show', id => '1' } from GET /admin/select_options/1" do
      params_from(:get, "/admin/select_options/1").should == {:controller => "admin/select_options", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/select_options', action => 'edit', id => '1' } from GET /admin/select_options/1;edit" do
      params_from(:get, "/admin/select_options/1/edit").should == {:controller => "admin/select_options", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/select_options', action => 'update', id => '1' } from PUT /admin/select_options/1" do
      params_from(:put, "/admin/select_options/1").should == {:controller => "admin/select_options", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/select_options', action => 'destroy', id => '1' } from DELETE /admin/select_options/1" do
      params_from(:delete, "/admin/select_options/1").should == {:controller => "admin/select_options", :action => "destroy", :id => "1"}
    end
  end
end