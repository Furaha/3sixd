require 'action_mailer'

ActionMailer::Base.delivery_method=:smtp

if Rails.env.development?
  ActionMailer::Base.default_url_options[:host] = "localhost:3000"
  ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => "587",
  :domain => "gmail.com",
  :authentication => :plain,
  :user_name => ENV["GMAIL_USERNAME_DEV"],
  :password =>  ENV["GMAIL_PASSWORD_DEV"],
  :enable_starttls_auto => true
  }  
end

if Rails.env.production?
  ActionMailer::Base.default_url_options[:host] = "http://furaha-oily.herokuapp.com"
  ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => "587",
  :domain => "gmail.com",
  :authentication => :plain,
  :user_name => ENV["GMAIL_USERNAME_PROD"],
  :password =>  ENV["GMAIL_PASSWORD_PROD"],
  :enable_starttls_auto => true
  }  
end

ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true 
ActionMailer::Base.default :charset => "utf-8"
ActionMailer::Base.default :content_type => "text/html"