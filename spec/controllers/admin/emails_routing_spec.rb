require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::EmailsController do
  describe "route generation" do

    it "should map { :controller => 'admin/emails', :action => 'index' } to /admin/emails" do
      route_for(:controller => "admin/emails", :action => "index").should == "/admin/emails"
    end
  
    it "should map { :controller => 'admin/emails', :action => 'new' } to /admin/emails/new" do
      route_for(:controller => "admin/emails", :action => "new").should == "/admin/emails/new"
    end
  
    it "should map { :controller => 'admin/emails', :action => 'show', :id => 1 } to /admin/emails/1" do
      route_for(:controller => "admin/emails", :action => "show", :id => 1).should == "/admin/emails/1"
    end
  
    it "should map { :controller => 'admin/emails', :action => 'edit', :id => 1 } to /admin/emails/1/edit" do
      route_for(:controller => "admin/emails", :action => "edit", :id => 1).should == "/admin/emails/1/edit"
    end
  
    it "should map { :controller => 'admin/emails', :action => 'update', :id => 1} to /admin/emails/1" do
      route_for(:controller => "admin/emails", :action => "update", :id => 1).should == "/admin/emails/1"
    end
  
    it "should map { :controller => 'admin/emails', :action => 'destroy', :id => 1} to /admin/emails/1" do
      route_for(:controller => "admin/emails", :action => "destroy", :id => 1).should == "/admin/emails/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'admin/emails', action => 'index' } from GET /admin/emails" do
      params_from(:get, "/admin/emails").should == {:controller => "admin/emails", :action => "index"}
    end
  
    it "should generate params { :controller => 'admin/emails', action => 'new' } from GET /admin/emails/new" do
      params_from(:get, "/admin/emails/new").should == {:controller => "admin/emails", :action => "new"}
    end
  
    it "should generate params { :controller => 'admin/emails', action => 'create' } from POST /admin/emails" do
      params_from(:post, "/admin/emails").should == {:controller => "admin/emails", :action => "create"}
    end
  
    it "should generate params { :controller => 'admin/emails', action => 'show', id => '1' } from GET /admin/emails/1" do
      params_from(:get, "/admin/emails/1").should == {:controller => "admin/emails", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/emails', action => 'edit', id => '1' } from GET /admin/emails/1;edit" do
      params_from(:get, "/admin/emails/1/edit").should == {:controller => "admin/emails", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/emails', action => 'update', id => '1' } from PUT /admin/emails/1" do
      params_from(:put, "/admin/emails/1").should == {:controller => "admin/emails", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/emails', action => 'destroy', id => '1' } from DELETE /admin/emails/1" do
      params_from(:delete, "/admin/emails/1").should == {:controller => "admin/emails", :action => "destroy", :id => "1"}
    end
  end
end