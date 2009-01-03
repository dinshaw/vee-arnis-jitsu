class SelectOption < ActiveRecord::Base
  acts_as_list :scope => :parent_id
  acts_as_tree
  
  # Create sti sub types
  def self.factory(type, params = nil)
    class_name = type
    class_name.constantize.new(params)
  end
  
end
