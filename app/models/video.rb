class Video < ActiveRecord::Base
  include AttachmentUpload
  acts_as_list
  belongs_to :video_category
  
  def validate
    errors.add_to_base("Video file #{[RAILS_ROOT,base_path,file_path].join("/")} does not exist") if !File.exist?([RAILS_ROOT,base_path,file_path].join("/"))
  end
  
  def base_path
    ["videos", video_category.video_directory].join("/")
  end
end
