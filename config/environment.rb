# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :port       => ENV['MAILGUN_SMTP_PORT'],
    :address    => ENV['MAILGUN_SMTP_PORT'],
    :user_name  => ENV['MAILGUN_SMTP_PORT'],
    :password   => ENV['MAILGUN_SMTP_PORT'],
    :domain     => 'obscure-castle-25165.herokuapp.com'
    :authentication => :plain,
}

ActionMailer::Base.delivery_method = :smtp