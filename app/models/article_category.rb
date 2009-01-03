class ArticleCategory < ActiveRecord::Base
  include AttachmentUpload
  acts_as_list
  attachment_names :photo
  acts_as_tree
  validates_presence_of :title
  has_many :articles, :order => :position
  has_many :parent_articles,
    :class_name => "Article",
    :conditions => "parent_id is null"
  
end
