class PhotoCategoriesController < ApplicationController

  # GET /photo_categories
  # GET /photo_categories.xml
  def index
    @photo_categories = PhotoCategory.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photo_categories }
    end
  end

  # GET /photo_categories/1
  # GET /photo_categories/1.xml
  def show
    @photo_category = PhotoCategory.find(params[:id])
  end
  

end
