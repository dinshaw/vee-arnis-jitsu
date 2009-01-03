class StoreCategory < ActiveRecord::Base
  acts_as_list
  acts_as_tree
  has_many :products, :order => :position
end
