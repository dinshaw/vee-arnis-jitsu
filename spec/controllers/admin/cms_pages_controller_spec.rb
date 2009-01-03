require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::CmsPagesController do
  before(:each) do
    do_login
  end
  
  describe "handling GET /cms_pages" do

    before(:each) do
      @cms_page = mock_model(CmsPage)
      CmsPage.stub!(:find).and_return([@cms_page])
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
  
    it "should find all pages" do
      CmsPage.should_receive(:find).with(:all, :order => :position).and_return([@cms_page])
      do_get
    end
  
    it "should assign the found pages for the view" do
      do_get
      assigns[:cms_pages].should == [@cms_page]
    end
  end

  describe "handling GET /pages.xml" do

    before(:each) do
      @cms_pages = mock("Array of CmsPages", :to_xml => "XML")
      CmsPage.stub!(:find).and_return(@cms_pages)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all pages" do
      CmsPage.should_receive(:find).with(:all, :order => :position).and_return(@cms_pages)
      do_get
    end
  
    it "should render the found pages as xml" do
      @cms_pages.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /pages/1" do

    before(:each) do
      @cms_page = mock_model(CmsPage)
      CmsPage.stub!(:find).and_return(@cms_page)
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
  
    it "should find the page requested" do
      CmsPage.should_receive(:find).with("1").and_return(@cms_page)
      do_get
    end
  
    it "should assign the found page for the view" do
      do_get
      assigns[:cms_page].should equal(@cms_page)
    end
  end

  describe "handling GET /pages/1.xml" do

    before(:each) do
      @cms_page = mock_model(CmsPage, :to_xml => "XML")
      CmsPage.stub!(:find).and_return(@cms_page)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the page requested" do
      CmsPage.should_receive(:find).with("1").and_return(@cms_page)
      do_get
    end
  
    it "should render the found page as xml" do
      @cms_page.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /pages/new" do

    before(:each) do
      @cms_page = mock_model(CmsPage)
      CmsPage.stub!(:new).and_return(@cms_page)
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
  
    it "should create an new page" do
      CmsPage.should_receive(:new).and_return(@cms_page)
      do_get
    end
  
    it "should not save the new page" do
      @cms_page.should_not_receive(:save_with_attachments)
      do_get
    end
  
    it "should assign the new page for the view" do
      do_get
      assigns[:cms_page].should equal(@cms_page)
    end
  end

  describe "handling GET /pages/1/edit" do

    before(:each) do
      @cms_page = mock_model(CmsPage)
      CmsPage.stub!(:find).and_return(@cms_page)
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
  
    it "should find the page requested" do
      CmsPage.should_receive(:find).and_return(@cms_page)
      do_get
    end
  
    it "should assign the found CmsPage for the view" do
      do_get
      assigns[:cms_page].should equal(@cms_page)
    end
  end

  describe "handling POST /pages" do

    before(:each) do
      @cms_page = mock_model(CmsPage, :to_param => "1")
      CmsPage.stub!(:new).and_return(@cms_page)
    end
    
    describe "with successful save" do
  
      def do_post
        @cms_page.should_receive(:save_with_attachments).and_return(true)
        post :create, :cms_page => {}
      end
  
      it "should create a new page" do
        CmsPage.should_receive(:new).with({}).and_return(@cms_page)
        do_post
      end

      it "should redirect to the new page" do
        do_post
        response.should redirect_to(admin_cms_page_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @cms_page.should_receive(:save_with_attachments).and_return(false)
        post :create, :cms_page => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /pages/1" do

    before(:each) do
      @cms_page = mock_model(CmsPage, :to_param => "1")
      CmsPage.stub!(:find).and_return(@cms_page)
    end
    
    describe "with successful update" do

      def do_put
        @cms_page.should_receive(:update_with_attachments).and_return(true)
        put :update, :id => "1"
      end

      it "should find the page requested" do
        CmsPage.should_receive(:find).with("1").and_return(@cms_page)
        do_put
      end

      it "should update the found page" do
        do_put
        assigns(:cms_page).should equal(@cms_page)
      end

      it "should assign the found page for the view" do
        do_put
        assigns(:cms_page).should equal(@cms_page)
      end

      it "should redirect to the page" do
        do_put
        response.should redirect_to(admin_cms_page_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @cms_page.should_receive(:update_with_attachments).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end
  
  

  describe "handling DELETE /pages/1" do

    before(:each) do
      @cms_page = mock_model(CmsPage, :destroy => true)
      CmsPage.stub!(:find).and_return(@cms_page)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the page requested" do
      CmsPage.should_receive(:find).with("1").and_return(@cms_page)
      do_delete
    end
  
    it "should call destroy on the found page" do
      @cms_page.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the pages list" do
      do_delete
      response.should redirect_to(admin_cms_pages_url)
    end
  end



  describe "handling PUT /pages/1/up" do
    fixtures :cms_pages

    describe "with successful update" do
      it "should move cms page down" do
        @home = cms_pages(:home)
        @about =  cms_pages(:about)
        get :index
        assigns[:cms_pages].should == [@home, @about]
        put :down, :id => @home.id
        get :index
        assigns[:cms_pages].should == [@about, @home]
      end
    end
  end
end