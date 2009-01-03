class Photo < ActiveRecord::Base
  include AttachmentUpload
  belongs_to :photo_category
  acts_as_list :scope => :photo_category_id
  acts_as_tree
  attachment_names :photo
  
end
