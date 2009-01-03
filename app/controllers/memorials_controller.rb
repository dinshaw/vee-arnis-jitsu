class MemorialsController < ApplicationController
  include ListMethods
  
  # GET /memorials
  # GET /memorials.xml
  def index
    @memorials = Memorial.find(:all, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @memorials }
    end
  end

  # GET /memorials/1
  # GET /memorials/1.xml
  def show
    @memorial = Memorial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @memorial }
    end
  end

  # GET /memorials/new
  # GET /memorials/new.xml
  def new
    @memorial = Memorial.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @memorial }
    end
  end

  # GET /memorials/1/edit
  def edit
    @memorial = Memorial.find(params[:id])
  end

  # POST /memorials
  # POST /memorials.xml
  def create
    @memorial = Memorial.new(params[:memorial])

    respond_to do |format|
      if @memorial.save_with_photo
        flash[:notice] = 'Memorial was successfully created.'
        format.html { redirect_to memorials_url }
        format.xml  { render :xml => @memorial, :status => :created, :location => @memorial }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @memorial.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /memorials/1
  # PUT /memorials/1.xml
  def update
    @memorial = Memorial.find(params[:id])

    respond_to do |format|
      if @memorial.update_with_photo(params[:memorial])
        flash[:notice] = 'Memorial was successfully updated.'
        format.html { redirect_to memorials_url}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @memorial.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /memorials/1
  # DELETE /memorials/1.xml
  def destroy
    @memorial = Memorial.find(params[:id])
    @memorial.destroy

    respond_to do |format|
      format.html { redirect_to(memorials_url) }
      format.xml  { head :ok }
    end
  end
end
