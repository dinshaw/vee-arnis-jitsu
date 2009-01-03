class Product < ActiveRecord::Base
  include AttachmentUpload
  acts_as_list :scope => :store_category_id
  acts_as_tree
  attachment_names :photo
  belongs_to :store_category
  belongs_to :video
  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :shipping_code
end
