# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
# RAILS_GEM_VERSION = '2.1.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.time_zone = 'Eastern Time (US & Canada)'

  PRIMARY_DOMAIN = 'VeeArnisJitsu.com'
  STAGING_DOMAIN = 'stage.VeeArnisJitsu.com'  
  SITE_NAME = "Vee Arnis Jitsu School of Self Defense"
  SITE_ABBR = "VAJ"
  ADMINEMAIL = "dinshaw@veearnisjitsu.com"
  
  NYC_GOOGLE_CALENDAR_PUBLIC_ICAL = "http://www.google.com/calendar/ical/veearnisjitsu.com_lh8vqcn2qcj1cf84388lnct54k%40group.calendar.google.com/public/basic.ics"
  BKLYN_GOOGLE_CALENDAR_PUBLIC_ICAL = "http://www.google.com/calendar/ical/veearnisjitsu.com_dkq9f33dc643h072r4kaujl208%40group.calendar.google.com/public/basic.ics"
  BB_GOOGLE_CALENDAR_PUBLIC_ICAL = "http://www.google.com/calendar/ical/veearnisjitsu.com_bten3pck0ntafqvl6h82skgohg%40group.calendar.google.com/public/basic.ics"  
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  # Skip frameworks you're not going to use. To use Rails without a database
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  config.gem "rubyist-aasm", :lib => "aasm", :source => "http://gems.github.com"
  config.gem 'mislav-will_paginate', :lib => 'will_paginate', :source => "http://gems.github.com"
  config.gem 'ryanb-acts-as-list', :lib => 'acts_as_list', :source => 'http://gems.github.com'
  config.gem "chronic", :version => '0.2.3'
  config.gem "packet"
  # config.gem "RedCloth", :lib => 'redcloth', :version => '4.1.0'
  config.gem "capistrano-ext", :lib => "capistrano"
  
  # Only load the plugins named here, in the order given. By default, all plugins 
  # in vendor/plugins are loaded in alphabetical order.
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Make Time.zone default to the specified zone, and make Active Record store time values
  # in the database in UTC, and return them converted to the specified local zone.
  # Run "rake -D time" for a list of tasks for finding time zone names. Uncomment to use default local time.
  config.time_zone = 'UTC'

  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_cb2_session',
    :secret      => 'c9be1a0b06d72cf91a36e24db5c99df97af6f7937e713eb510c5b89240d2d6cd49060543fabd0cc4fb271bf2fd53ad3406ddb2d6210a21978ac665a47aadeefb'
  }

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with "rake db:sessions:create")
  config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  config.active_record.observers = :user_observer
end
ActionView::Base.field_error_proc = Proc.new {|html_tag, instance|  %(<span class="field-with-errors">#{html_tag}</span>)}

CGI::Session.expire_after 1.day

require 'will_paginate'

Mime::Type.register "application/pdf", :pdf
ExceptionNotifier.exception_recipients = %w(dinshaw@veearnisjitsu.com)
ExceptionNotifier.sender_address = %("#{SITE_NAME} App Error" <admin@veearnisjitsu.com>)
ExceptionNotifier.email_prefix = "[ERROR] "# These defaults are used in GeoKit::Mappable.distance_to and in acts_as_mappable
# GeoKit::default_units = :miles
# GeoKit::default_formula = :sphere
# 
# # This is the timeout value in seconds to be used for calls to the geocoder web
# # services.  For no timeout at all, comment out the setting.  The timeout unit
# # is in seconds. 
# GeoKit::Geocoders::timeout = 3
# 
# # These settings are used if web service calls must be routed through a proxy.
# # These setting can be nil if not needed, otherwise, addr and port must be 
# # filled in at a minimum.  If the proxy requires authentication, the username
# # and password can be provided as well.
# GeoKit::Geocoders::proxy_addr = nil
# GeoKit::Geocoders::proxy_port = nil
# GeoKit::Geocoders::proxy_user = nil
# GeoKit::Geocoders::proxy_pass = nil
# 
# # This is your yahoo application key for the Yahoo Geocoder.
# # See http://developer.yahoo.com/faq/index.html#appid
# # and http://developer.yahoo.com/maps/rest/V1/geocode.html
# GeoKit::Geocoders::yahoo = 'REPLACE_WITH_YOUR_YAHOO_KEY'
#     
# # This is your Google Maps geocoder key. 
# # See http://www.google.com/apis/maps/signup.html
# # and http://www.google.com/apis/maps/documentation/#Geocoding_Examples
# GeoKit::Geocoders::google = 'REPLACE_WITH_YOUR_GOOGLE_KEY'
#     
# # This is your username and password for geocoder.us.
# # To use the free service, the value can be set to nil or false.  For 
# # usage tied to an account, the value should be set to username:password.
# # See http://geocoder.us
# # and http://geocoder.us/user/signup
# GeoKit::Geocoders::geocoder_us = false 
# 
# # This is your authorization key for geocoder.ca.
# # To use the free service, the value can be set to nil or false.  For 
# # usage tied to an account, set the value to the key obtained from
# # Geocoder.ca.
# # See http://geocoder.ca
# # and http://geocoder.ca/?register=1
# GeoKit::Geocoders::geocoder_ca = false
# 
# # This is the order in which the geocoders are called in a failover scenario
# # If you only want to use a single geocoder, put a single symbol in the array.
# # Valid symbols are :google, :yahoo, :us, and :ca.
# # Be aware that there are Terms of Use restrictions on how you can use the 
# # various geocoders.  Make sure you read up on relevant Terms of Use for each
# # geocoder you are going to use.
# GeoKit::Geocoders::provider_order = [:google,:us]
