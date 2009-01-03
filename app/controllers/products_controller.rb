class ProductsController < ApplicationController
  before_filter :get_category
  def get_category
    @category = StoreCategory.find(params[:store_category_id])
  end
  # GET /products
  # GET /products.xml
  def index
    @products = @category.products.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = @category.products.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = @category.products.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = @category.products.new(params[:product])

    respond_to do |format|
      if @product.save_with_attachments
        flash[:notice] = 'Product was successfully created.'
        format.html { redirect_to store_category_product_url(@category, @product)  }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = @category.products.find(params[:id])

    respond_to do |format|
      if @product.update_with_attachments(params[:product])
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to store_category_product_url(@category, @product) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to store_category_products_url(@category) }
      format.xml  { head :ok }
    end
  end
end
