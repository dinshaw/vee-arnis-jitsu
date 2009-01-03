require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::FaqsController do
  before(:each) do
    do_login
    @faq_category = mock_model(FaqCategory)
    FaqCategory.stub!(:find).and_return(@faq_category)
  end
  
  describe "handling GET /faqs" do

    before(:each) do
      @faq = mock_model(Faq)
      @faq_category.stub!(:faqs).and_return([@faq])
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
  
    it "should find all faqs" do
      @faq_category.should_receive(:faqs).and_return([@faq])
      do_get
    end
  
    it "should assign the found faqs for the view" do
      do_get
      assigns[:faqs].should == [@faq]
    end
  end

  # describe "handling GET /faqs.xml" do
  # 
  #   before(:each) do
  #     @faqs = mock("Array of Faqs", :to_xml => "XML")
  #     @faq_category.stub!(:faqs).and_return([@faq])
  #   end
  # 
  #   def do_get
  #     @request.env["HTTP_ACCEPT"] = "application/xml"
  #     get :index
  #   end
  # 
  #   it "should be successful" do
  #     do_get
  #     response.should be_success
  #   end
  # 
  #   it "should find all faqs" do
  #     @faq_category.should_receive(:faqs).and_return([@faq])
  #     do_get
  #   end
  # 
  #   it "should render the found faqs as xml" do
  #     @faqs.should_receive(:to_xml).and_return("XML")
  #     do_get
  #     response.body.should == "XML"
  #   end
  # end

  describe "handling GET /faqs/1" do

    before(:each) do
      @faq = mock_model(Faq)
      Faq.stub!(:find).and_return(@faq)
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
  
    it "should find the faq requested" do
      Faq.should_receive(:find).with("1").and_return(@faq)
      do_get
    end
  
    it "should assign the found faq for the view" do
      do_get
      assigns[:faq].should equal(@faq)
    end
  end

  # describe "handling GET /faqs/1.xml" do
  # 
  #   before(:each) do
  #     @faq = mock_model(Faq, :to_xml => "XML")
  #     Faq.stub!(:find).and_return(@faq)
  #   end
  # 
  #   def do_get
  #     @request.env["HTTP_ACCEPT"] = "application/xml"
  #     get :show, :id => "1"
  #   end
  # 
  #   it "should be successful" do
  #     do_get
  #     response.should be_success
  #   end
  # 
  #   it "should find the faq requested" do
  #     Faq.should_receive(:find).with("1").and_return(@faq)
  #     do_get
  #   end
  # 
  #   it "should render the found faq as xml" do
  #     @faq.should_receive(:to_xml).and_return("XML")
  #     do_get
  #     response.body.should == "XML"
  #   end
  # end

  describe "handling GET /faqs/new" do

    before(:each) do
      @faq = mock_model(Faq)
      Faq.stub!(:new).and_return(@faq)
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
  
    it "should create an new faq" do
      Faq.should_receive(:new).and_return(@faq)
      do_get
    end
  
    it "should not save the new faq" do
      @faq.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new faq for the view" do
      do_get
      assigns[:faq].should equal(@faq)
    end
  end

  describe "handling GET /faqs/1/edit" do

    before(:each) do
      @faq = mock_model(Faq)
      Faq.stub!(:find).and_return(@faq)
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
  
    it "should find the faq requested" do
      Faq.should_receive(:find).and_return(@faq)
      do_get
    end
  
    it "should assign the found Faq for the view" do
      do_get
      assigns[:faq].should equal(@faq)
    end
  end

  describe "handling POST /faqs" do

    before(:each) do
      @faq = mock_model(Faq, :to_param => "1", :faqs => [])
      Faq.stub!(:new).and_return(@faq)
    end
    
    describe "with successful save" do
  
      def do_post
        @faq.should_receive(:save).and_return(true)
        post :create, :faq => {}
      end
  
      # it "should create a new faq" do
      #   @faq_category.should_receive("faqs.create").and_return(@faq)
      #   do_post
      # end

      # it "should redirect to the new faq" do
      #   do_post
      #   response.should redirect_to(admin_faq_category_faq_url(@faq_category,"1"))
      # end
      
    end
    
    describe "with failed save" do

      def do_post
        @faq.should_receive(:save).and_return(false)
        post :create, :faq => {}
      end
  
      # it "should re-render 'new'" do
      #   do_post
      #   response.should render_template('new')
      # end
      
    end
  end

  describe "handling PUT /faqs/1" do

    before(:each) do
      @faq = mock_model(Faq, :to_param => "1")
      Faq.stub!(:find).and_return(@faq)
    end
    
    describe "with successful update" do

      def do_put
        @faq.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the faq requested" do
        Faq.should_receive(:find).with("1").and_return(@faq)
        do_put
      end

      it "should update the found faq" do
        do_put
        assigns(:faq).should equal(@faq)
      end

      it "should assign the found faq for the view" do
        do_put
        assigns(:faq).should equal(@faq)
      end

      it "should redirect to the faq" do
        do_put
        response.should redirect_to(admin_faq_category_faq_url(@faq_category,"1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @faq.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /faqs/1" do

    before(:each) do
      @faq = mock_model(Faq, :destroy => true)
      Faq.stub!(:find).and_return(@faq)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the faq requested" do
      Faq.should_receive(:find).with("1").and_return(@faq)
      do_delete
    end
  
    it "should call destroy on the found faq" do
      @faq.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the faqs list" do
      do_delete
      response.should redirect_to(admin_faq_category_faqs_url(@faq_category))
    end
  end
end