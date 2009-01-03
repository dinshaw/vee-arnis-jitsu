class Admin::FacilitiesController < AdminController
    include ListMethods
  # GET /facilities
  # GET /facilities.xml
  def index
    @facilities = Facility.find(:all, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @facilities }
    end
  end

  # GET /facilities/1
  # GET /facilities/1.xml
  def show
    @facility = Facility.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @facility }
    end
  end

  # GET /facilities/new
  # GET /facilities/new.xml
  def new
    @facility = Facility.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @facility }
    end
  end

  # GET /facilities/1/edit
  def edit
    @facility = Facility.find(params[:id])
  end

  # POST /facilities
  # POST /facilities.xml
  def create
    @facility = Facility.new(params[:facility])

    respond_to do |format|
      if @facility.save_with_attachments
        flash[:notice] = 'Facility was successfully created.'
        format.html { redirect_to admin_facility_url(@facility) }
        format.xml  { render :xml => @facility, :status => :created, :location => @facility }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @facility.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /facilities/1
  # PUT /facilities/1.xml
  def update
    @facility = Facility.find(params[:id])

    respond_to do |format|
      if @facility.update_with_attachments(params[:facility])
        flash[:notice] = 'Facility was successfully updated.'
        format.html { redirect_to admin_facility_url(@facility) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @facility.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /facilities/1
  # DELETE /facilities/1.xml
  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy

    respond_to do |format|
      format.html { redirect_to admin_facilities_url }
      format.xml  { head :ok }
    end
  end
end
