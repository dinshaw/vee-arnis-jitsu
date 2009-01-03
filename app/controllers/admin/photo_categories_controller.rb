class Admin::PhotoCategoriesController < AdminController
  include ListMethods
  # GET /photo_categories
  # GET /photo_categories.xml
  def index
    @photo_categories = PhotoCategory.find(:all, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photo_categories }
    end
  end

  # GET /photo_categories/1
  # GET /photo_categories/1.xml
  def show
    @photo_category = PhotoCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo_category }
    end
  end

  # GET /photo_categories/new
  # GET /photo_categories/new.xml
  def new
    @photo_category = PhotoCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo_category }
    end
  end

  # GET /photo_categories/1/edit
  def edit
    @photo_category = PhotoCategory.find(params[:id])
  end

  # POST /photo_categories
  # POST /photo_categories.xml
  def create
    @photo_category = PhotoCategory.new(params[:photo_category])

    respond_to do |format|
      if @photo_category.save_with_attachments
        flash[:notice] = 'Photo Category was successfully created.'
        format.html { redirect_to admin_photo_category_url(@photo_category) }
        format.xml  { render :xml => @photo_category, :status => :created, :location => @photo_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photo_categories/1
  # PUT /photo_categories/1.xml
  def update
    @photo_category = PhotoCategory.find(params[:id])

    respond_to do |format|
      if @photo_category.update_with_attachments(params[:photo_category])
        flash[:notice] = 'Photo Category was successfully updated.'
        format.html { redirect_to admin_photo_category_url(@photo_category) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_categories/1
  # DELETE /photo_categories/1.xml
  def destroy
    @photo_category = PhotoCategory.find(params[:id])
    @photo_category.destroy

    respond_to do |format|
      format.html { redirect_to admin_photo_categories_url }
      format.xml  { head :ok }
    end
  end
end
