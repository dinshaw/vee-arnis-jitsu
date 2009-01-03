require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::ConfigValuesController do
  before(:each) do
    do_login
  end
  describe "handling GET /config_values" do

    before(:each) do
      @config_value = mock_model(ConfigValue)
      ConfigValue.stub!(:find).and_return([@config_value])
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
  
    it "should find all config_values" do
      ConfigValue.should_receive(:find).with(:all, :order => :position).and_return([@config_value])
      do_get
    end
  
    it "should assign the found config_values for the view" do
      do_get
      assigns[:config_values].should == [@config_value]
    end
  end

  describe "handling GET /config_values.xml" do

    before(:each) do
      @config_values = mock("Array of ConfigValues", :to_xml => "XML")
      ConfigValue.stub!(:find).and_return(@config_values)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all config_values" do
      ConfigValue.should_receive(:find).with(:all, :order => :position).and_return(@config_values)
      do_get
    end
  
    it "should render the found config_values as xml" do
      @config_values.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /config_values/1" do

    before(:each) do
      @config_value = mock_model(ConfigValue)
      ConfigValue.stub!(:find).and_return(@config_value)
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
  
    it "should find the config_value requested" do
      ConfigValue.should_receive(:find).with("1").and_return(@config_value)
      do_get
    end
  
    it "should assign the found config_value for the view" do
      do_get
      assigns[:config_value].should equal(@config_value)
    end
  end

  describe "handling GET /config_values/1.xml" do

    before(:each) do
      @config_value = mock_model(ConfigValue, :to_xml => "XML")
      ConfigValue.stub!(:find).and_return(@config_value)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the config_value requested" do
      ConfigValue.should_receive(:find).with("1").and_return(@config_value)
      do_get
    end
  
    it "should render the found config_value as xml" do
      @config_value.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /config_values/new" do

    before(:each) do
      @config_value = mock_model(ConfigValue)
      ConfigValue.stub!(:new).and_return(@config_value)
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
  
    it "should create an new config_value" do
      ConfigValue.should_receive(:new).and_return(@config_value)
      do_get
    end
  
    it "should not save the new config_value" do
      @config_value.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new config_value for the view" do
      do_get
      assigns[:config_value].should equal(@config_value)
    end
  end

  describe "handling GET /config_values/1/edit" do

    before(:each) do
      @config_value = mock_model(ConfigValue)
      ConfigValue.stub!(:find).and_return(@config_value)
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
  
    it "should find the config_value requested" do
      ConfigValue.should_receive(:find).and_return(@config_value)
      do_get
    end
  
    it "should assign the found ConfigValue for the view" do
      do_get
      assigns[:config_value].should equal(@config_value)
    end
  end

  describe "handling POST /config_values" do

    before(:each) do
      @config_value = mock_model(ConfigValue, :to_param => "1")
      ConfigValue.stub!(:new).and_return(@config_value)
    end
    
    describe "with successful save" do
  
      def do_post
        @config_value.should_receive(:save).and_return(true)
        post :create, :config_value => {}
      end
  
      it "should create a new config_value" do
        ConfigValue.should_receive(:new).with({}).and_return(@config_value)
        do_post
      end

      it "should redirect to the new config_value" do
        do_post
        response.should redirect_to( admin_config_values_url)
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @config_value.should_receive(:save).and_return(false)
        post :create, :config_value => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /config_values/1" do

    before(:each) do
      @config_value = mock_model(ConfigValue, :to_param => "1")
      ConfigValue.stub!(:find).and_return(@config_value)
    end
    
    describe "with successful update" do

      def do_put
        @config_value.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the config_value requested" do
        ConfigValue.should_receive(:find).with("1").and_return(@config_value)
        do_put
      end

      it "should update the found config_value" do
        do_put
        assigns(:config_value).should equal(@config_value)
      end

      it "should assign the found config_value for the view" do
        do_put
        assigns(:config_value).should equal(@config_value)
      end

      it "should redirect to the config_value" do
        do_put
        response.should redirect_to(admin_config_values_url)
      end

    end
    
    describe "with failed update" do

      def do_put
        @config_value.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /config_values/1" do

    before(:each) do
      @config_value = mock_model(ConfigValue, :destroy => true)
      ConfigValue.stub!(:find).and_return(@config_value)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the config_value requested" do
      ConfigValue.should_receive(:find).with("1").and_return(@config_value)
      do_delete
    end
  
    it "should call destroy on the found config_value" do
      @config_value.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the config_values list" do
      do_delete
      response.should redirect_to(admin_config_values_url)
    end
  end
end