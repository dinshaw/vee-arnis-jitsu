require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::TaggingsController do
  describe "route generation" do

    it "should map { :controller => 'admin/taggings', :action => 'index' } to /admin/taggings" do
      route_for(:controller => "admin/taggings", :action => "index").should == "/admin/taggings"
    end
  
    it "should map { :controller => 'admin/taggings', :action => 'new' } to /admin/taggings/new" do
      route_for(:controller => "admin/taggings", :action => "new").should == "/admin/taggings/new"
    end
  
    it "should map { :controller => 'admin/taggings', :action => 'show', :id => 1 } to /admin/taggings/1" do
      route_for(:controller => "admin/taggings", :action => "show", :id => 1).should == "/admin/taggings/1"
    end
  
    it "should map { :controller => 'admin/taggings', :action => 'edit', :id => 1 } to /admin/taggings/1/edit" do
      route_for(:controller => "admin/taggings", :action => "edit", :id => 1).should == "/admin/taggings/1/edit"
    end
  
    it "should map { :controller => 'admin/taggings', :action => 'update', :id => 1} to /admin/taggings/1" do
      route_for(:controller => "admin/taggings", :action => "update", :id => 1).should == "/admin/taggings/1"
    end
  
    it "should map { :controller => 'admin/taggings', :action => 'destroy', :id => 1} to /admin/taggings/1" do
      route_for(:controller => "admin/taggings", :action => "destroy", :id => 1).should == "/admin/taggings/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'admin/taggings', action => 'index' } from GET /admin/taggings" do
      params_from(:get, "/admin/taggings").should == {:controller => "admin/taggings", :action => "index"}
    end
  
    it "should generate params { :controller => 'admin/taggings', action => 'new' } from GET /admin/taggings/new" do
      params_from(:get, "/admin/taggings/new").should == {:controller => "admin/taggings", :action => "new"}
    end
  
    it "should generate params { :controller => 'admin/taggings', action => 'create' } from POST /admin/taggings" do
      params_from(:post, "/admin/taggings").should == {:controller => "admin/taggings", :action => "create"}
    end
  
    it "should generate params { :controller => 'admin/taggings', action => 'show', id => '1' } from GET /admin/taggings/1" do
      params_from(:get, "/admin/taggings/1").should == {:controller => "admin/taggings", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/taggings', action => 'edit', id => '1' } from GET /admin/taggings/1;edit" do
      params_from(:get, "/admin/taggings/1/edit").should == {:controller => "admin/taggings", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/taggings', action => 'update', id => '1' } from PUT /admin/taggings/1" do
      params_from(:put, "/admin/taggings/1").should == {:controller => "admin/taggings", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/taggings', action => 'destroy', id => '1' } from DELETE /admin/taggings/1" do
      params_from(:delete, "/admin/taggings/1").should == {:controller => "admin/taggings", :action => "destroy", :id => "1"}
    end
  end
end