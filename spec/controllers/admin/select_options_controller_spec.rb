require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::SelectOptionsController do
  before(:each) do
    do_login
  end
  
  describe "handling GET /select_options" do

    before(:each) do
      @select_option = mock_model(SelectOption)
      SelectOption.stub!(:find).and_return([@select_option])
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
  
    it "should find all select_options" do
      SelectOption.should_receive(:find).with(:all, :order => :position).and_return([@select_option])
      do_get
    end
  
    it "should assign the found select_options for the view" do
      do_get
      assigns[:select_options].should == [@select_option]
    end
  end

  describe "handling GET /select_options.xml" do

    before(:each) do
      @select_options = mock("Array of SelectOptions", :to_xml => "XML")
      SelectOption.stub!(:find).and_return(@select_options)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all select_options" do
      SelectOption.should_receive(:find).with(:all, :order => :position).and_return(@select_options)
      do_get
    end
  
    it "should render the found select_options as xml" do
      @select_options.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /select_options/1" do

    before(:each) do
      @select_option = mock_model(SelectOption)
      SelectOption.stub!(:find).and_return(@select_option)
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
  
    it "should find the select_option requested" do
      SelectOption.should_receive(:find).with("1").and_return(@select_option)
      do_get
    end
  
    it "should assign the found select_option for the view" do
      do_get
      assigns[:select_option].should equal(@select_option)
    end
  end

  describe "handling GET /select_options/1.xml" do

    before(:each) do
      @select_option = mock_model(SelectOption, :to_xml => "XML")
      SelectOption.stub!(:find).and_return(@select_option)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the select_option requested" do
      SelectOption.should_receive(:find).with("1").and_return(@select_option)
      do_get
    end
  
    it "should render the found select_option as xml" do
      @select_option.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /select_options/new" do

    before(:each) do
      @select_option = mock_model(SelectOption)
      SelectOption.stub!(:new).and_return(@select_option)
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
  
    it "should create an new select_option" do
      SelectOption.should_receive(:new).and_return(@select_option)
      do_get
    end
  
    it "should not save the new select_option" do
      @select_option.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new select_option for the view" do
      do_get
      assigns[:select_option].should equal(@select_option)
    end
  end

  describe "handling GET /select_options/1/edit" do

    before(:each) do
      @select_option = mock_model(SelectOption)
      SelectOption.stub!(:find).and_return(@select_option)
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
  
    it "should find the select_option requested" do
      SelectOption.should_receive(:find).and_return(@select_option)
      do_get
    end
  
    it "should assign the found SelectOption for the view" do
      do_get
      assigns[:select_option].should equal(@select_option)
    end
  end

  describe "handling POST /select_options" do

    before(:each) do
      @select_option = mock_model(SelectOption, :to_param => "1")
      SelectOption.stub!(:new).and_return(@select_option)
    end
    
    describe "with successful save" do
  
      def do_post
        @select_option.should_receive(:save).and_return(true)
        post :create, :select_option => {}
      end
  
      it "should create a new select_option" do
        SelectOption.should_receive(:new).with({}).and_return(@select_option)
        do_post
      end

      it "should redirect to the new select_option" do
        do_post
        response.should redirect_to(admin_select_options_url)
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @select_option.should_receive(:save).and_return(false)
        post :create, :select_option => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /select_options/1" do

    before(:each) do
      @select_option = mock_model(SelectOption, :to_param => "1")
      SelectOption.stub!(:find).and_return(@select_option)
    end
    
    describe "with successful update" do

      def do_put
        @select_option.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the select_option requested" do
        SelectOption.should_receive(:find).with("1").and_return(@select_option)
        do_put
      end

      it "should update the found select_option" do
        do_put
        assigns(:select_option).should equal(@select_option)
      end

      it "should assign the found select_option for the view" do
        do_put
        assigns(:select_option).should equal(@select_option)
      end

      it "should redirect to the select_option" do
        do_put
        response.should redirect_to(admin_select_options_url)
      end

    end
    
    describe "with failed update" do

      def do_put
        @select_option.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /select_options/1" do

    before(:each) do
      @select_option = mock_model(SelectOption, :destroy => true)
      SelectOption.stub!(:find).and_return(@select_option)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the select_option requested" do
      SelectOption.should_receive(:find).with("1").and_return(@select_option)
      do_delete
    end
  
    it "should call destroy on the found select_option" do
      @select_option.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the select_options list" do
      do_delete
      response.should redirect_to(admin_select_options_url)
    end
  end
end