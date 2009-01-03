class SystemsController < ApplicationController
  
  # GET /systems
  # GET /systems.xml
  def index
    @systems = System.find(:all, :order => "position")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @systems }
    end
  end

end
