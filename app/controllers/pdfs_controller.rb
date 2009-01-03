class PdfsController < ApplicationController
  # GET /pdfs
  # GET /pdfs.xml
  def index
    @pdfs = Pdf.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pdfs }
    end
  end

  # GET /pdfs/1
  # GET /pdfs/1.xml
  def show
    @pdf = Pdf.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pdf }
    end
  end

  # GET /pdfs/new
  # GET /pdfs/new.xml
  def new
    @pdf = Pdf.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pdf }
    end
  end

  # GET /pdfs/1/edit
  def edit
    @pdf = Pdf.find(params[:id])
  end

  # POST /pdfs
  # POST /pdfs.xml
  def create
    @pdf = Pdf.new(params[:pdf])

    respond_to do |format|
      if @pdf.save
        flash[:notice] = 'Pdf was successfully created.'
        format.html { redirect_to(@pdf) }
        format.xml  { render :xml => @pdf, :status => :created, :location => @pdf }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pdf.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pdfs/1
  # PUT /pdfs/1.xml
  def update
    @pdf = Pdf.find(params[:id])

    respond_to do |format|
      if @pdf.update_attributes(params[:pdf])
        flash[:notice] = 'Pdf was successfully updated.'
        format.html { redirect_to(@pdf) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pdf.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pdfs/1
  # DELETE /pdfs/1.xml
  def destroy
    @pdf = Pdf.find(params[:id])
    @pdf.destroy

    respond_to do |format|
      format.html { redirect_to(pdfs_url) }
      format.xml  { head :ok }
    end
  end
end
