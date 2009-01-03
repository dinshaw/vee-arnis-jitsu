require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::EmailsController do
  before(:each) do
    do_login
  end
  describe "handling GET /admin/emails" do

    before(:each) do
      @email = mock_model(Email)
      Email.stub!(:find).and_return([@email])
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
  
    it "should find all emails" do
      Email.should_receive(:find).with(:all, :order => "created_at desc").and_return([@email])
      do_get
    end
  
    it "should assign the found emails for the view" do
      do_get
      assigns[:emails].should == [@email]
    end
  end

  describe "handling GET /admin/emails.xml" do

    before(:each) do
      @emails = mock("Array of Emails", :to_xml => "XML")
      Email.stub!(:find).and_return(@emails)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all emails" do
      Email.should_receive(:find).with(:all, :order => "created_at desc").and_return(@emails)
      do_get
    end
  
    it "should render the found emails as xml" do
      @emails.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /admin/emails/1" do

    before(:each) do
      @email = mock_model(Email)
      Email.stub!(:find).and_return(@email)
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
  
    it "should find the email requested" do
      Email.should_receive(:find).with("1").and_return(@email)
      do_get
    end
  
    it "should assign the found email for the view" do
      do_get
      assigns[:email].should equal(@email)
    end
  end

  describe "handling GET /admin/emails/1.xml" do

    before(:each) do
      @email = mock_model(Email, :to_xml => "XML")
      Email.stub!(:find).and_return(@email)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the email requested" do
      Email.should_receive(:find).with("1").and_return(@email)
      do_get
    end
  
    it "should render the found email as xml" do
      @email.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /admin/emails/new" do

    before(:each) do
      @email = mock_model(Email)
      Email.stub!(:new).and_return(@email)
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
  
    it "should create an new email" do
      Email.should_receive(:new).and_return(@email)
      do_get
    end
  
    it "should not save the new email" do
      @email.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new email for the view" do
      do_get
      assigns[:email].should equal(@email)
    end
  end

  describe "handling GET /admin/emails/1/edit" do

    before(:each) do
      @email = mock_model(Email)
      Email.stub!(:find).and_return(@email)
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
  
    it "should find the email requested" do
      Email.should_receive(:find).and_return(@email)
      do_get
    end
  
    it "should assign the found Email for the view" do
      do_get
      assigns[:email].should equal(@email)
    end
  end

  describe "handling POST /admin/emails" do

    before(:each) do
      @email = mock_model(Email, :to_param => "1")
      Email.stub!(:new).and_return(@email)
    end
    
    describe "with successful save" do
  
      def do_post
        @email.should_receive(:save).and_return(true)
        post :create, :email => {}
      end
  
      it "should create a new email" do
        Email.should_receive(:new).with({}).and_return(@email)
        do_post
      end

      it "should redirect to the new email" do
        do_post
        response.should redirect_to(admin_email_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @email.should_receive(:save).and_return(false)
        post :create, :email => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /admin/emails/1" do

    before(:each) do
      @email = mock_model(Email, :to_param => "1")
      Email.stub!(:find).and_return(@email)
    end
    
    describe "with successful update" do

      def do_put
        @email.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the email requested" do
        Email.should_receive(:find).with("1").and_return(@email)
        do_put
      end

      it "should update the found email" do
        do_put
        assigns(:email).should equal(@email)
      end

      it "should assign the found email for the view" do
        do_put
        assigns(:email).should equal(@email)
      end

      it "should redirect to the email" do
        do_put
        response.should redirect_to(admin_email_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @email.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /admin/emails/1" do

    before(:each) do
      @email = mock_model(Email, :destroy => true)
      Email.stub!(:find).and_return(@email)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the email requested" do
      Email.should_receive(:find).with("1").and_return(@email)
      do_delete
    end
  
    it "should call destroy on the found email" do
      @email.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the emails list" do
      do_delete
      response.should redirect_to(admin_emails_url)
    end
  end
end