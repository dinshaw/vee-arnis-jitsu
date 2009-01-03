# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # custom error message style
  def error_messages_for(*params)
    options = params.extract_options!.symbolize_keys
    if object = options.delete(:object)
      objects = [object].flatten
    else
      objects = params.collect {|object_name| instance_variable_get("@#{object_name}") }.compact
    end
    count   = objects.inject(0) {|sum, object| sum + object.errors.count }
    unless count.zero?
      html = {:class => :errors}
      error_messages = objects.sum {|object| object.errors.full_messages.enum_for(:each_with_index).map {|msg,i| content_tag(:li, "*Error: #{i+1}. #{msg}") } }.join\
      contents = ''
      contents << content_tag(:ul, error_messages)

      content_tag(:div, contents, html)
    else
      ''
    end
  end

  # take the title from the assigned @page or a default
  def page_title 
    title = @cms_page ? "| #{@cms_page.title}" : '' 
    %(<title>#{SITE_NAME} #{title}</title>) 
  end 

  # write the tag for both meta_description and meta_keywords
  def meta(name, content) 
    %(<meta name="#{name}" content="#{content}" />) 
  end

  # output meta description or resuce with nil if no page is set
  def meta_description
    @cms_page.meta_description rescue SITE_NAME 
  end

  # output meta keywords tag or resuce with nil if no page is set
  def meta_keywords 
    @cms_page.meta_keywords rescue nil
  end

  def state_options
    [
      ['Select a State', ''],
      ['Alabama', 'AL'], 
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'], 
      ['California', 'CA'], 
      ['Colorado', 'CO'], 
      ['Connecticut', 'CT'], 
      ['Delaware', 'DE'], 
      ['District Of Columbia', 'DC'], 
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'], 
      ['Idaho', 'ID'], 
      ['Illinois', 'IL'], 
      ['Indiana', 'IN'], 
      ['Iowa', 'IA'], 
      ['Kansas', 'KS'], 
      ['Kentucky', 'KY'], 
      ['Louisiana', 'LA'], 
      ['Maine', 'ME'], 
      ['Maryland', 'MD'], 
      ['Massachusetts', 'MA'], 
      ['Michigan', 'MI'], 
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'], 
      ['Missouri', 'MO'], 
      ['Montana', 'MT'], 
      ['Nebraska', 'NE'], 
      ['Nevada', 'NV'], 
      ['New Hampshire', 'NH'], 
      ['New Jersey', 'NJ'], 
      ['New Mexico', 'NM'], 
      ['New York', 'NY'], 
      ['North Carolina', 'NC'], 
      ['North Dakota', 'ND'], 
      ['Ohio', 'OH'], 
      ['Oklahoma', 'OK'], 
      ['Oregon', 'OR'], 
      ['Pennsylvania', 'PA'], 
      ['Rhode Island', 'RI'], 
      ['South Carolina', 'SC'], 
      ['South Dakota', 'SD'], 
      ['Tennessee', 'TN'], 
      ['Texas', 'TX'], 
      ['Utah', 'UT'], 
      ['Vermont', 'VT'], 
      ['Virginia', 'VA'], 
      ['Washington', 'WA'], 
      ['West Virginia', 'WV'], 
      ['Wisconsin', 'WI'], 
      ['Wyoming', 'WY']
    ]
  end

  # combine :notice and :message
  def flash_block
    "<p id=\"flash\">#{flash[:notice]}#{flash[:message]}#{flash[:error]}</p>" if [flash[:message], flash[:notice], flash[:error]].any?
  end

  # rescue form no @page set with default
  def content_heading
    @content_heading || @page.title rescue SITE_NAME
  end

  # rescue form no @page set with nil
  def content_sub_heading
    @cms_page.sub_title rescue nil
  end

  # liks for listed resources in admin area
  def position_links(object, admin = true)
    object_with_admin = admin == true ? "admin_#{object.class.to_s.tableize.singularize}" : object.class
    [ link_to('Up', eval("up_#{object_with_admin}_path(object)"), :method => :put), link_to('Down', eval("down_#{object_with_admin}_path(object)"), :method => :put) ].join(" | ") 
  end  

  def tags_list
    Tag.find(:all, :include => :taggings, :order => "tags.count desc", :limit => 1).delete_if{|t| t.taggings.length <= 0}
  end

  def tag_link_list(tags = nil, link_tags = true)
    tags = !tags.nil? ? tags : tags_list
    tags.collect{|t| 
      link_tags ? link_to(t.name, "", :class => "tag-short-cut", :title => t.name) : t.name
    }.join(", ")
  end
  
  def is(value)
    value == true ? 'Yes' : 'No'
  end
end
