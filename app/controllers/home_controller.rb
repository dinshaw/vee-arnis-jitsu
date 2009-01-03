require 'icalendar'
require 'open-uri'
require 'runt'
class HomeController < ApplicationController
  include Runt

  skip_before_filter :login_required

  def index
  end

  def schedule
    @year = Date.today.year
    @month = Date.today.month

    nyc_calendars = Icalendar.parse(open(NYC_GOOGLE_CALENDAR_PUBLIC_ICAL))
    @nyc_schedule = Schedule.new
    @nyc_events = []
    nyc_calendars.first.events.each do |e|
      if !e.recurrence_rules.first.nil?
        new_nyc_event = CalEvent.new(e)
        @nyc_events << new_nyc_event
        @nyc_schedule.add(new_nyc_event, new_nyc_event.expression)
      end
    end

    bklyn_calendars = Icalendar.parse(open(BKLYN_GOOGLE_CALENDAR_PUBLIC_ICAL))
    @bklyn_schedule = Schedule.new
    @bklyn_events = []
    bklyn_calendars.first.events.each do |e|
      if !e.recurrence_rules.first.nil?
        new_bklyn_event = CalEvent.new(e)
        @bklyn_events << new_bklyn_event
        @bklyn_schedule.add(new_bklyn_event, new_bklyn_event.expression)
      end
    end

    bb_calendars = Icalendar.parse(open(BB_GOOGLE_CALENDAR_PUBLIC_ICAL))
    @bb_events = []
    bb_calendars.first.events.each do |e|
      @bb_events << CalEvent.new(e)
    end
  end

end
