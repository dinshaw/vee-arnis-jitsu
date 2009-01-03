class PhotosController < ApplicationController
  before_filter :get_photo_category
  def get_photo_category
    @photo_category = PhotoCategory.find(params[:photo_category_id])
  end
  

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
end
