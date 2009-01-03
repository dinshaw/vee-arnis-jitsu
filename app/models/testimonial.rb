class Testimonial < ActiveRecord::Base
  include AttachmentUpload
  acts_as_list
  validates_presence_of :title
end
