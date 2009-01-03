require 'googlecalendar.rb'
class PublicController < ApplicationController
  skip_before_filter :login_required

  def google_calendar
    @cms_page = get_cms_page_by_reference_string("Calendar")
    @year = params[:year] ? params[:year].to_i : Time.new.year
    @month = params[:month] ? params[:month].to_i : Time.new.month
    data = scan(GOOGLE_CALENDAR_PUBLIC)
    calendar = parse data
    @events = calendar.events
  end

end
