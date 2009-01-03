class VideoCategoriesController < ApplicationController
  include ListMethods
  
  # GET /video_categories
  # GET /video_categories.xml
  def index
    @video_categories = VideoCategory.find(:all, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @video_categories }
    end
  end

  # GET /video_categories/1
  # GET /video_categories/1.xml
  def show
    redirect_to video_categories_path
  end

  # GET /video_categories/new
  # GET /video_categories/new.xml
  def new
    @video_category = VideoCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @video_category }
    end
  end

  # GET /video_categories/1/edit
  def edit
    @video_category = VideoCategory.find(params[:id])
  end

  # POST /video_categories
  # POST /video_categories.xml
  def create
    @video_category = VideoCategory.new(params[:video_category])

    respond_to do |format|
      if @video_category.save
        flash[:notice] = 'VideoCategory was successfully created.'
        format.html { redirect_to video_categories_path }
        format.xml  { render :xml => @video_category, :status => :created, :location => @video_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @video_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /video_categories/1
  # PUT /video_categories/1.xml
  def update
    @video_category = VideoCategory.find(params[:id])

    respond_to do |format|
      if @video_category.update_attributes(params[:video_category])
        flash[:notice] = 'VideoCategory was successfully updated.'
        format.html { redirect_to video_categories_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @video_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /video_categories/1
  # DELETE /video_categories/1.xml
  def destroy
    @video_category = VideoCategory.find(params[:id])
    @video_category.destroy

    respond_to do |format|
      format.html { redirect_to(video_categories_url) }
      format.xml  { head :ok }
    end
  end
end
