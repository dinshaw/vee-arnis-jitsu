class Faq < ActiveRecord::Base
  acts_as_list :scope => :faq_category_id
  validates_presence_of :question
  validates_presence_of :answer
  belongs_to :faq_category
end
