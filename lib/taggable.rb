module Taggable
  attr_accessor :tag_list
  
  def tag_list=(tag_string)
    if self.new_record?
      @tag_string = tag_string
    else
      self.create_taggings(tag_string)  # parse tags, create tags & taggings
    end
  end

  def tag_array
    tags.collect{|t| t.name}
  end
  
  def tag_list
    tag_array.join(", ")
  end

  def after_create
    self.tag_list = @tag_string if @tag_string
  end

  def create_taggings(tag_string)
    # make array with no white space
    new_tags = tag_string.split(",").collect{|t| t.strip }

    # remove tags not in list - for deleting tags
    taggings.each{|tagging| tagging.destroy unless new_tags.include?(tagging.tag.name)}

    # create new tags if they don't exist
    new_tags.each do |tag|
      new_tag = Tag.find_by_name(tag) || Tag.create(:name => tag)
      taggings.create(:tag_id => new_tag.id) unless taggings.find_by_tag_id(new_tag.id)
    end
  end

end