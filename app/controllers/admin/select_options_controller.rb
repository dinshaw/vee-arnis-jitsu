class Admin::SelectOptionsController < AdminController
  # GET /select_options
  # GET /select_options.xml
  def index
    @select_options = SelectOption.find(:all, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @select_options }
    end
  end

  # GET /select_options/1
  # GET /select_options/1.xml
  def show
    @select_option = SelectOption.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @select_option }
    end
  end

  # GET /select_options/new
  # GET /select_options/new.xml
  def new
    @select_option = SelectOption.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @select_option }
    end
  end

  # GET /select_options/1/edit
  def edit
    @select_option = SelectOption.find(params[:id])
  end

  # POST /select_options
  # POST /select_options.xml
  def create
    @select_option = !params[:select_option][:parent_id].blank? ? SelectOption.factory(SelectOption.find(params[:select_option][:parent_id]).select_option_value, params[:select_option]) : SelectOption.new(params[:select_option])

    respond_to do |format|
      if @select_option.save
        flash[:notice] = 'SelectOption was successfully created.'
        format.html { redirect_to admin_select_options_url }
        format.xml  { render :xml => @select_option, :status => :created, :location => @select_option }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @select_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /select_options/1
  # PUT /select_options/1.xml
  def update
    @select_option = SelectOption.find(params[:id])

    respond_to do |format|
      if @select_option.update_attributes(params[:select_option])
        flash[:notice] = 'SelectOption was successfully updated.'
        format.html { redirect_to admin_select_options_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @select_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /select_options/1
  # DELETE /select_options/1.xml
  def destroy
    @select_option = SelectOption.find(params[:id])
    @select_option.destroy

    respond_to do |format|
      format.html { redirect_to admin_select_options_url }
      format.xml  { head :ok }
    end
  end
end
