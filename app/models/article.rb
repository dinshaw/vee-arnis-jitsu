class Article < ActiveRecord::Base
  include AttachmentUpload
  acts_as_list :scope => [:article_category_id]
  belongs_to :article_category
  acts_as_tree
  attachment_names :photo
end
