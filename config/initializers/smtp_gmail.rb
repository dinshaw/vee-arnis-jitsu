# require "smtp_tls" 
ActionMailer::Base.smtp_settings = { 
  :address => "smtp.gmail.com", 
  :port => 587, 
  :user_name => "admin@dinshawdesign.com", 
  :password => "F5236p", 
  :authentication => :plain 
} 
