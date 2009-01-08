require 'runt'
class CalEvent
  include Runt
  extend ActiveSupport::Memoizable


  def google_cal_days
    {
      "MO" => Monday,
      "TU" => Tuesday,
      "WE" => Wednesday,
      "TH" => Thursday,
      "FR" => Friday,
      "SA" => Saturday,
      "SU" => Sunday
    }    
  end

  memoize :google_cal_days

  attr_accessor :summary, :start_date, :end_date, :description, :expression, :rrule

  def initialize(ical_event)
    self.summary = ical_event.summary
    p ical_event.summary
    p ical_event.dtstart
    p "--------"
    self.start_date = Chronic.parse(ical_event.dtstart.strftime("%x %H:%M"))
    self.end_date = Chronic.parse(ical_event.dtend.strftime("%x %H:%M"))
    self.description = ical_event.description
    self.rrule = ical_event.recurrence_rules
  end

  def expression
    # split the ["FREQ=WEEKLY;BYDAY=TU,TH;WKST=SU"]
    unless rrule.first.nil?
      rrule_array = rrule.first.scan(/\=([^;]*);/)
      case rrule_array.first.to_s
      when "WEEKLY"
        expr_array = []
        rrule_array[1].first.split(',').each{ |weekday|
          expr_array << "DIWeek.new(#{google_cal_days[weekday]}) & REDay.new(#{start_date.strftime('%H')},#{start_date.strftime('%M')},#{(end_date-1.second).strftime('%H')},#{(end_date-1.second).strftime('%M')})"
        }
      end
      eval expr_array.join(" | ")
    else
      nil
    end
  end

  def details
    "<ul class=\"event_details\">
    <li class=\"title\">#{summary}</li>
    <li class=\"description\">#{description}</li>
    <li class=\"start\">#{display_date('start')}</li>
    <li class=\"end\">#{display_date('end')}</li>					
    </ul>"
  end
  def details_w_date
    "<ul class=\"event_details\">
    <li class=\"description\">#{start_date.strftime("%d")}</li>    
    <li class=\"title\">#{summary}</li>
    <li class=\"start\">#{display_date('start')}</li>
    <li class=\"end\">#{display_date('end')}</li>					
    </ul>"
  end

  def display_date(which)
    case which
    when "start"
      date = start_date
    when "end"
      date = end_date
    end
    date.strftime("%l:%M %p")
  end
end
