require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::TagsController do
  describe "route generation" do

    it "should map { :controller => 'admin/tags', :action => 'index' } to /admin/tags" do
      route_for(:controller => "admin/tags", :action => "index").should == "/admin/tags"
    end
  
    it "should map { :controller => 'admin/tags', :action => 'new' } to /admin/tags/new" do
      route_for(:controller => "admin/tags", :action => "new").should == "/admin/tags/new"
    end
  
    it "should map { :controller => 'admin/tags', :action => 'show', :id => 1 } to /admin/tags/1" do
      route_for(:controller => "admin/tags", :action => "show", :id => 1).should == "/admin/tags/1"
    end
  
    it "should map { :controller => 'admin/tags', :action => 'edit', :id => 1 } to /admin/tags/1/edit" do
      route_for(:controller => "admin/tags", :action => "edit", :id => 1).should == "/admin/tags/1/edit"
    end
  
    it "should map { :controller => 'admin/tags', :action => 'update', :id => 1} to /admin/tags/1" do
      route_for(:controller => "admin/tags", :action => "update", :id => 1).should == "/admin/tags/1"
    end
  
    it "should map { :controller => 'admin/tags', :action => 'destroy', :id => 1} to /admin/tags/1" do
      route_for(:controller => "admin/tags", :action => "destroy", :id => 1).should == "/admin/tags/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'admin/tags', action => 'index' } from GET /admin/tags" do
      params_from(:get, "/admin/tags").should == {:controller => "admin/tags", :action => "index"}
    end
  
    it "should generate params { :controller => 'admin/tags', action => 'new' } from GET /admin/tags/new" do
      params_from(:get, "/admin/tags/new").should == {:controller => "admin/tags", :action => "new"}
    end
  
    it "should generate params { :controller => 'admin/tags', action => 'create' } from POST /admin/tags" do
      params_from(:post, "/admin/tags").should == {:controller => "admin/tags", :action => "create"}
    end
  
    it "should generate params { :controller => 'admin/tags', action => 'show', id => '1' } from GET /admin/tags/1" do
      params_from(:get, "/admin/tags/1").should == {:controller => "admin/tags", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/tags', action => 'edit', id => '1' } from GET /admin/tags/1;edit" do
      params_from(:get, "/admin/tags/1/edit").should == {:controller => "admin/tags", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/tags', action => 'update', id => '1' } from PUT /admin/tags/1" do
      params_from(:put, "/admin/tags/1").should == {:controller => "admin/tags", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/tags', action => 'destroy', id => '1' } from DELETE /admin/tags/1" do
      params_from(:delete, "/admin/tags/1").should == {:controller => "admin/tags", :action => "destroy", :id => "1"}
    end
  end
end