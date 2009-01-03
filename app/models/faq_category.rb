class FaqCategory < ActiveRecord::Base
  acts_as_list :scope => :parent_id
  acts_as_tree
  validates_presence_of :title
  has_many :faqs, :order => :position
end
