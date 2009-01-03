class CmsPagesController < ApplicationController
  skip_before_filter :login_required
  
  before_filter :get_cms_page_nav
  
  def get_cms_page_nav
    @cms_page_nav = []
  end

  def show
    @cms_page = params[:reference_string] ? get_cms_page_by_reference_string(params[:reference_string]) : CmsPage.find_by_reference_string("home")
    @cms_page_nav = @cms_page.root.children rescue CmsPage.roots
  end
  
end
