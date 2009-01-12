class StylesheetsController < ApplicationController
  layout false
  
  skip_before_filter :session_expiry
  skip_before_filter :login_required
  skip_before_filter :do_system_config #, :set_local, :set_charset
  # skip userstamp filters
  skip_before_filter :set_stamper
  skip_after_filter :reset_stamper  
    
  before_filter :do_colors
  before_filter :do_widths, :only => [:layout, :nav, :center_layout, :admin]
  
  @@all_files = :layout, :main, :errors, :admin, :nav, :maintenance, :diagnostic, :diagnostic_ie7, :reset, :center_layout, :tables, :lists, :typography, :forms, :tool_tips, :calendar
  ssl_allowed :layout, :main, :errors, :admin, :nav, :maintenance, :diagnostic, :diagnostic_ie7, :reset, :center_layout, :tables, :lists, :typography, :forms, :tool_tips, :calendar
  caches_page :layout, :main, :errors, :admin, :nav, :maintenance, :diagnostic, :diagnostic_ie7, :reset, :center_layout, :tables, :lists, :typography, :forms, :tool_tips, :calendar

  def initialize
    @@all_files.each do |css|
      eval <<-EOS
        def #{css} 
          respond_to { |format| format.css }
        end
      EOS
    end
  end
  
  # se the site colors
  def do_colors
    @red = "#ec2325"
    @yellow = "#ffec05"
    @grey = "#ececec"
    @dark_grey = "#666"
    @admin_content_bg = "#fcc"
    
    @table_border = "#fff"
    @th_bg = "#ebebeb"    
    @th_txt = "#333"    
    @td_bg = "#f5f9fd"
    @td_bg_even = "#e7f0f9"
    @td_bg_hover = "#cce4fe"
  end
  
  
  
  # Set the layout widths
  def do_widths
    @left_nav_width = 120
    @left_nav_right_margin = 20
    @width = 1000
    # set to 0 for centered layouts
    @left_margin = 0
  end
  
  # render templates with css headers
  def do_respond_to
    respond_to { |format| format.css }
  end
end
