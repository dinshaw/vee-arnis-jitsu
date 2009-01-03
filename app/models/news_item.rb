class NewsItem < ActiveRecord::Base
  include AttachmentUpload
  acts_as_list
end
