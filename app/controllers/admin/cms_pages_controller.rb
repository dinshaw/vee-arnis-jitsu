class Admin::CmsPagesController < AdminController
  # GET /pages
  # GET /pages.xml
  def index
    @cms_pages = CmsPage.find(:all, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cms_pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @cms_page = CmsPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cms_page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @cms_page = CmsPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cms_page }
    end
  end

  # GET /pages/1/edit
  def edit
    @cms_page = CmsPage.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    @cms_page = CmsPage.new(params[:cms_page])

    respond_to do |format|
      if @cms_page.save_with_attachments
        flash[:notice] = 'CmsPage was successfully created.'
        format.html { redirect_to(admin_cms_page_url(@cms_page)) }
        format.xml  { render :xml => @cms_page, :status => :created, :location => @cms_page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cms_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @cms_page = CmsPage.find(params[:id])

    respond_to do |format|
      if @cms_page.update_with_attachments(params[:cms_page])
        flash[:notice] = 'CmsPage was successfully updated.'
        format.html { redirect_to(admin_cms_page_url(@cms_page)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cms_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @cms_page = CmsPage.find(params[:id])
    @cms_page.destroy

    respond_to do |format|
      format.html { redirect_to(admin_cms_pages_url) }
      format.xml  { head :ok }
    end
  end
end
