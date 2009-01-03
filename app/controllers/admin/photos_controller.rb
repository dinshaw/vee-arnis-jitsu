class Admin::PhotosController < AdminController
  before_filter :get_photo_category
  def get_photo_category
    @photo_category = PhotoCategory.find(params[:photo_category_id])
  end
  
  def up
    Photo.find(params[:id]).move_higher
    redirect_to(admin_photo_category_photos_url)
  end

  def down
    Photo.find(params[:id]).move_lower
    redirect_to(admin_photo_category_photos_url)  end
  
  # GET /photos
  # GET /photos.xml
  def index
    @photos = @photo_category.photos

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.xml
  def create
    @photo = @photo_category.photos.new(params[:photo])

    respond_to do |format|
      if @photo.save_with_attachments
        flash[:notice] = 'Photo was successfully created.'
        format.html { redirect_to admin_photo_category_photo_url(@photo_category,@photo) }
        format.xml  { render :xml => @photo, :status => :created, :location => @photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_with_attachments(params[:photo])
        flash[:notice] = 'Photo was successfully updated.'
        format.html { redirect_to admin_photo_category_photo_url(@photo_category,@photo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(admin_photo_category_photos_url(@photo_category)) }
      format.xml  { head :ok }
    end
  end
end
