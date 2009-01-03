# Allow admin users to administer page text, titles, meta data and whatever else you want to add.
# reference string should probably be protected from edit as that is uesed oin the code to find the page
class CmsPage < ActiveRecord::Base
  include AttachmentUpload
  has_friendly_id :reference_string, :use_slug => true
  acts_as_tree
  acts_as_list :scope => :parent_id
  validates_presence_of :reference_string
  validates_uniqueness_of :reference_string
  validates_presence_of :title
  validates_format_of :reference_string, :with => /[a-z0-9_]+/, :message => "may only contain a-z, 0-9, and _ "
  attachment_names :img_main  
end
