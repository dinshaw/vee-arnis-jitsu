class Admin::FaqCategoriesController < AdminController
  # GET /faq_categories
  # GET /faq_categories.xml
  def index
    @faq_categories = FaqCategory.find(:all, :order => "parent_id, position")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @faq_categories }
    end
  end

  # GET /faq_categories/1
  # GET /faq_categories/1.xml
  def show
    @faq_category = FaqCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @faq_category }
    end
  end

  # GET /faq_categories/new
  # GET /faq_categories/new.xml
  def new
    @faq_category = FaqCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @faq_category }
    end
  end

  # GET /faq_categories/1/edit
  def edit
    @faq_category = FaqCategory.find(params[:id])
  end

  # POST /faq_categories
  # POST /faq_categories.xml
  def create
    @faq_category = FaqCategory.new(params[:faq_category])

    respond_to do |format|
      if @faq_category.save
        flash[:notice] = 'FaqCategory was successfully created.'
        format.html { redirect_to( admin_faq_categories_path) }
        format.xml  { render :xml => @faq_category, :status => :created, :location => @faq_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @faq_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /faq_categories/1
  # PUT /faq_categories/1.xml
  def update
    @faq_category = FaqCategory.find(params[:id])

    respond_to do |format|
      if @faq_category.update_attributes(params[:faq_category])
        flash[:notice] = 'FaqCategory was successfully updated.'
        format.html { redirect_to(admin_faq_categories_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @faq_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /faq_categories/1
  # DELETE /faq_categories/1.xml
  def destroy
    @faq_category = FaqCategory.find(params[:id])
    @faq_category.destroy

    respond_to do |format|
      format.html { redirect_to(admin_faq_categories_url) }
      format.xml  { head :ok }
    end
  end
end
