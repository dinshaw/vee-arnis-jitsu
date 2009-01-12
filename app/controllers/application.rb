# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  rescue_from ActionController::RoutingError, :with => :route_not_found
  rescue_from ActionController::MethodNotAllowed, :with => :invalid_method
  
  include AuthenticatedSystem
  include RoleRequirementSystem
  include Userstamp
  include ExceptionNotifiable 
  
  layout 'main'

  helper :all

  protect_from_forgery :secret => 'bc79e2619efcc2a2a60a5ac147309986'

  filter_parameter_logging :password, :password_hash, :password_salt, :email

  # include SslRequirement

  skip_before_filter :ensure_proper_protocol # if ['development','test','staging'].include?(RAILS_ENV)
            
  before_filter :do_system_config
  before_filter :authenticate if ENV['RAILS_ENV'] == 'staging'
  
  # creates a site accesible hash for accessing config values
  def do_system_config
    @config_values = Hash[*ConfigValue.all.map {|cv| [cv.name,cv.value] }.flatten]
  end
  
  def redirect_with_flash(message, destination_path)
    flash[:notice] = message
    redirect_to destination_path and return
  end
  
  # not sure why this is Page.new. Probably not hte right solution
  def get_cms_page_by_reference_string(reference_string)
    @page = CmsPage.find_by_reference_string(reference_string) || CmsPage.new(:title => "CMS Error: Missing CMS Page", :sub_title => "Missing Entry: #{reference_string}", :body => "<p>Please create an entry with a <strong>reference_string</strong> value of <strong><em>#{reference_string}</em></strong> under <strong>CMS Pages</strong> in the Admin Area</p>")
  end
  
  # example auto complete field
  # auto_complete_for :search, :tags
  # def auto_complete_for_search_tags
  #   re = Regexp.new("^#{params[:search][:tags]}", "i")
  #   @tags = Tag.search(params[:search][:tags],:order => :name).collect(&:name)
  #   render :inline => "<%= content_tag(:ul, @tags.map { |tag| content_tag(:li, h(tag)) }) %>"
  # end
  
  def route_not_found
    render :text => 'What are you looking for?', :status => :not_found
  end
  
  def invalid_method
    message = "Now, did your mom tell you to #{request.request_method.to_s.upcase} that?"
    render :text => message, :status => :method_not_allowed
  end
  
  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "foo" && password == "bar"
    end
  end
end
