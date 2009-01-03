class ConfigValue < ActiveRecord::Base
  acts_as_list
  validates_presence_of :name,:value
  validates_uniqueness_of :name
end
