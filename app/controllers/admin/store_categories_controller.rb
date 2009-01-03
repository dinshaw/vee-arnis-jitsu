class Admin::StoreCategoriesController < AdminController

  # GET /store_categories
  # GET /store_categories.xml
  def index
    @store_categories = StoreCategory.find(:all, :order => :position)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @store_categories }
    end
  end

  # GET /store_categories/1
  # GET /store_categories/1.xml
  def show
    @store_category = StoreCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @store_category }
    end
  end

  # GET /store_categories/new
  # GET /store_categories/new.xml
  def new
    @store_category = StoreCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @store_category }
    end
  end

  # GET /store_categories/1/edit
  def edit
    @store_category = StoreCategory.find(params[:id])
  end

  # POST /store_categories
  # POST /store_categories.xml
  def create
    @store_category = StoreCategory.new(params[:store_category])

    respond_to do |format|
      if @store_category.save
        flash[:notice] = 'Store Category was successfully created.'
        format.html { redirect_to admin_store_categories_url}
        format.xml  { render :xml => @store_category, :status => :created, :location => @store_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @store_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /store_categories/1
  # PUT /store_categories/1.xml
  def update
    @store_category = StoreCategory.find(params[:id])

    respond_to do |format|
      if @store_category.update_attributes(params[:store_category])
        flash[:notice] = 'Store Category was successfully updated.'
        format.html { redirect_to admin_store_categories_url}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @store_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /store_categories/1
  # DELETE /store_categories/1.xml
  def destroy
    @store_category = StoreCategory.find(params[:id])
    @store_category.destroy

    respond_to do |format|
      format.html { redirect_to(admin_store_categories_url) }
      format.xml  { head :ok }
    end
  end
end
