class VideosController < ApplicationController
  before_filter :get_category, :except => "download_video"
  skip_before_filter :login_required  
  def get_category
    @video_category = VideoCategory.find(params[:video_category_id])
  end
  
  # GET /videos
  # GET /videos.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @videos }
    end
  end

  # GET /videos/1
  # GET /videos/1.xml
  def show
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @video }
    end
  end

  def download_video
    @video = Video.find(params[:id])
    
    file_path = [RAILS_ROOT,@video.base_path,@video.file_path].join("/")
    
    content_type = "video/x-flv"
    
    # Check the report for readablitily and existance
    if File.exist?(file_path)
      if File.readable?(file_path)
        send_file(file_path, 
        :type => content_type, 
        :filename => @video.file_path)
      else
        flash[:notice] = "Corrupt Report Error: couldn't open file: #{file_path} for reading"
      end
    else
      flash[:notice] = "Corrupt Report Error: couldn't find the file: #{file_path}"
    end
  end
end
