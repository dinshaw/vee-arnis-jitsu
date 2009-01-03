require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::ConfigValuesController do
  describe "route generation" do

    it "should map { :controller => 'admin/config_values', :action => 'index' } to /admin/config_values" do
      route_for(:controller => "admin/config_values", :action => "index").should == "/admin/config_values"
    end
  
    it "should map { :controller => 'admin/config_values', :action => 'new' } to /admin/config_values/new" do
      route_for(:controller => "admin/config_values", :action => "new").should == "/admin/config_values/new"
    end
  
    it "should map { :controller => 'admin/config_values', :action => 'show', :id => 1 } to /admin/config_values/1" do
      route_for(:controller => "admin/config_values", :action => "show", :id => 1).should == "/admin/config_values/1"
    end
  
    it "should map { :controller => 'admin/config_values', :action => 'edit', :id => 1 } to /admin/config_values/1/edit" do
      route_for(:controller => "admin/config_values", :action => "edit", :id => 1).should == "/admin/config_values/1/edit"
    end
  
    it "should map { :controller => 'admin/config_values', :action => 'update', :id => 1} to /admin/config_values/1" do
      route_for(:controller => "admin/config_values", :action => "update", :id => 1).should == "/admin/config_values/1"
    end
  
    it "should map { :controller => 'admin/config_values', :action => 'destroy', :id => 1} to /admin/config_values/1" do
      route_for(:controller => "admin/config_values", :action => "destroy", :id => 1).should == "/admin/config_values/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'admin/config_values', action => 'index' } from GET /admin/config_values" do
      params_from(:get, "/admin/config_values").should == {:controller => "admin/config_values", :action => "index"}
    end
  
    it "should generate params { :controller => 'admin/config_values', action => 'new' } from GET /admin/config_values/new" do
      params_from(:get, "/admin/config_values/new").should == {:controller => "admin/config_values", :action => "new"}
    end
  
    it "should generate params { :controller => 'admin/config_values', action => 'create' } from POST /admin/config_values" do
      params_from(:post, "/admin/config_values").should == {:controller => "admin/config_values", :action => "create"}
    end
  
    it "should generate params { :controller => 'admin/config_values', action => 'show', id => '1' } from GET /admin/config_values/1" do
      params_from(:get, "/admin/config_values/1").should == {:controller => "admin/config_values", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/config_values', action => 'edit', id => '1' } from GET /admin/config_values/1;edit" do
      params_from(:get, "/admin/config_values/1/edit").should == {:controller => "admin/config_values", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/config_values', action => 'update', id => '1' } from PUT /admin/config_values/1" do
      params_from(:put, "/admin/config_values/1").should == {:controller => "admin/config_values", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/config_values', action => 'destroy', id => '1' } from DELETE /admin/config_values/1" do
      params_from(:delete, "/admin/config_values/1").should == {:controller => "admin/config_values", :action => "destroy", :id => "1"}
    end
  end
end