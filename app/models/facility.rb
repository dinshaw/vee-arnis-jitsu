class Facility < ActiveRecord::Base
  include Validations
  include AttachmentUpload
  attachment_names :photo
  
  acts_as_list
  validates_presence_of :title, :address, :city, :state  

  def validate
    validate_phone('phone')
  end

  def city_state_zip
    city + " " + state + ", " + zip
  end

end
