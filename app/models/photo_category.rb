class PhotoCategory < ActiveRecord::Base
  include AttachmentUpload
  acts_as_list
  attachment_names :photo
  acts_as_tree
  validates_presence_of :title
  has_many :photos, :order => :position, :dependent => :destroy
end
