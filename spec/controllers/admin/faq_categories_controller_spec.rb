require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::FaqCategoriesController do
  before(:each) do
    do_login
  end
  describe "handling GET /faq_categories" do

    before(:each) do
      @faq_category = mock_model(FaqCategory)
      FaqCategory.stub!(:find).and_return([@faq_category])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all faq_categories" do
      FaqCategory.should_receive(:find).with(:all, :order => "parent_id, position").and_return([@faq_category])
      do_get
    end
  
    it "should assign the found faq_categories for the view" do
      do_get
      assigns[:faq_categories].should == [@faq_category]
    end
  end

  describe "handling GET /faq_categories.xml" do

    before(:each) do
      @faq_categories = mock("Array of FaqCategories", :to_xml => "XML")
      FaqCategory.stub!(:find).and_return(@faq_categories)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all faq_categories" do
      FaqCategory.should_receive(:find).with(:all, :order => "parent_id, position").and_return(@faq_categories)
      do_get
    end
  
    it "should render the found faq_categories as xml" do
      @faq_categories.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /faq_categories/1" do

    before(:each) do
      @faq_category = mock_model(FaqCategory)
      FaqCategory.stub!(:find).and_return(@faq_category)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the faq_category requested" do
      FaqCategory.should_receive(:find).with("1").and_return(@faq_category)
      do_get
    end
  
    it "should assign the found faq_category for the view" do
      do_get
      assigns[:faq_category].should equal(@faq_category)
    end
  end

  describe "handling GET /faq_categories/1.xml" do

    before(:each) do
      @faq_category = mock_model(FaqCategory, :to_xml => "XML")
      FaqCategory.stub!(:find).and_return(@faq_category)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the faq_category requested" do
      FaqCategory.should_receive(:find).with("1").and_return(@faq_category)
      do_get
    end
  
    it "should render the found faq_category as xml" do
      @faq_category.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /faq_categories/new" do

    before(:each) do
      @faq_category = mock_model(FaqCategory)
      FaqCategory.stub!(:new).and_return(@faq_category)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new faq_category" do
      FaqCategory.should_receive(:new).and_return(@faq_category)
      do_get
    end
  
    it "should not save the new faq_category" do
      @faq_category.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new faq_category for the view" do
      do_get
      assigns[:faq_category].should equal(@faq_category)
    end
  end

  describe "handling GET /faq_categories/1/edit" do

    before(:each) do
      @faq_category = mock_model(FaqCategory)
      FaqCategory.stub!(:find).and_return(@faq_category)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the faq_category requested" do
      FaqCategory.should_receive(:find).and_return(@faq_category)
      do_get
    end
  
    it "should assign the found FaqCategory for the view" do
      do_get
      assigns[:faq_category].should equal(@faq_category)
    end
  end

  describe "handling POST /faq_categories" do

    before(:each) do
      @faq_category = mock_model(FaqCategory, :to_param => "1")
      FaqCategory.stub!(:new).and_return(@faq_category)
    end
    
    describe "with successful save" do
  
      def do_post
        @faq_category.should_receive(:save).and_return(true)
        post :create, :faq_category => {}
      end
  
      it "should create a new faq_category" do
        FaqCategory.should_receive(:new).with({}).and_return(@faq_category)
        do_post
      end

      it "should redirect to index" do
        do_post
        response.should redirect_to(admin_faq_categories_url)
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @faq_category.should_receive(:save).and_return(false)
        post :create, :faq_category => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /faq_categories/1" do

    before(:each) do
      @faq_category = mock_model(FaqCategory, :to_param => "1")
      FaqCategory.stub!(:find).and_return(@faq_category)
    end
    
    describe "with successful update" do

      def do_put
        @faq_category.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the faq_category requested" do
        FaqCategory.should_receive(:find).with("1").and_return(@faq_category)
        do_put
      end

      it "should update the found faq_category" do
        do_put
        assigns(:faq_category).should equal(@faq_category)
      end

      it "should assign the found faq_category for the view" do
        do_put
        assigns(:faq_category).should equal(@faq_category)
      end

      it "should redirect to index" do
        do_put
        response.should redirect_to(admin_faq_categories_url)
      end

    end
    
    describe "with failed update" do

      def do_put
        @faq_category.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /faq_categories/1" do

    before(:each) do
      @faq_category = mock_model(FaqCategory, :destroy => true)
      FaqCategory.stub!(:find).and_return(@faq_category)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the faq_category requested" do
      FaqCategory.should_receive(:find).with("1").and_return(@faq_category)
      do_delete
    end
  
    it "should call destroy on the found faq_category" do
      @faq_category.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the faq_categories list" do
      do_delete
      response.should redirect_to(admin_faq_categories_url)
    end
  end
end