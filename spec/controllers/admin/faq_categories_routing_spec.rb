require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::FaqCategoriesController do
  describe "route generation" do

    it "should map { :controller => 'admin/faq_categories', :action => 'index' } to /admin/faq_categories" do
      route_for(:controller => "admin/faq_categories", :action => "index").should == "/admin/faq_categories"
    end
  
    it "should map { :controller => 'admin/faq_categories', :action => 'new' } to /admin/faq_categories/new" do
      route_for(:controller => "admin/faq_categories", :action => "new").should == "/admin/faq_categories/new"
    end
  
    it "should map { :controller => 'admin/faq_categories', :action => 'show', :id => 1 } to /admin/faq_categories/1" do
      route_for(:controller => "admin/faq_categories", :action => "show", :id => 1).should == "/admin/faq_categories/1"
    end
  
    it "should map { :controller => 'admin/faq_categories', :action => 'edit', :id => 1 } to /admin/faq_categories/1/edit" do
      route_for(:controller => "admin/faq_categories", :action => "edit", :id => 1).should == "/admin/faq_categories/1/edit"
    end
  
    it "should map { :controller => 'admin/faq_categories', :action => 'update', :id => 1} to /admin/faq_categories/1" do
      route_for(:controller => "admin/faq_categories", :action => "update", :id => 1).should == "/admin/faq_categories/1"
    end
  
    it "should map { :controller => 'admin/faq_categories', :action => 'destroy', :id => 1} to /admin/faq_categories/1" do
      route_for(:controller => "admin/faq_categories", :action => "destroy", :id => 1).should == "/admin/faq_categories/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'admin/faq_categories', action => 'index' } from GET /admin/faq_categories" do
      params_from(:get, "/admin/faq_categories").should == {:controller => "admin/faq_categories", :action => "index"}
    end
  
    it "should generate params { :controller => 'admin/faq_categories', action => 'new' } from GET /admin/faq_categories/new" do
      params_from(:get, "/admin/faq_categories/new").should == {:controller => "admin/faq_categories", :action => "new"}
    end
  
    it "should generate params { :controller => 'admin/faq_categories', action => 'create' } from POST /admin/faq_categories" do
      params_from(:post, "/admin/faq_categories").should == {:controller => "admin/faq_categories", :action => "create"}
    end
  
    it "should generate params { :controller => 'admin/faq_categories', action => 'show', id => '1' } from GET /admin/faq_categories/1" do
      params_from(:get, "/admin/faq_categories/1").should == {:controller => "admin/faq_categories", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/faq_categories', action => 'edit', id => '1' } from GET /admin/faq_categories/1;edit" do
      params_from(:get, "/admin/faq_categories/1/edit").should == {:controller => "admin/faq_categories", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/faq_categories', action => 'update', id => '1' } from PUT /admin/faq_categories/1" do
      params_from(:put, "/admin/faq_categories/1").should == {:controller => "admin/faq_categories", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'admin/faq_categories', action => 'destroy', id => '1' } from DELETE /admin/faq_categories/1" do
      params_from(:delete, "/admin/faq_categories/1").should == {:controller => "admin/faq_categories", :action => "destroy", :id => "1"}
    end
  end
end