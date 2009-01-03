class VideoCategory < ActiveRecord::Base
  include AttachmentUpload
  acts_as_list
  attachment_names :photo
  acts_as_tree
  validates_presence_of :title
  has_many :videos, :dependent => :destroy
  
  def video_directory
    title.gsub(" ","_").singularize.downcase
  end
  
  def validate
    errors.add_to_base("You must create the directory #{video_directory}") if !File.exist?(RAILS_ROOT + "/videos/" + video_directory)
  end
end
