class Professor < ActiveRecord::Base
  include AttachmentUpload
  acts_as_list
  attachment_names :photo
end
