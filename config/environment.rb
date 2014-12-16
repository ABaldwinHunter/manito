# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'

require 'pony'


# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

configure do

  # config.action_mailer.raise_delivery_errors = true
  # config.action_mailer.delivery_method = :smtp
  # host = 'https://thawing-fortress-5755.herokuapp.com'
  # config.action_mailer.default_url_options = {host: host} 
  # ActionMailer::Base.smtp_settings = {
  #         :address        => 'smtp.sendgrid.net',
  #         :port           => '587',
  #         :authentication => :plain,
  #         :user_name      => ENV['SENDGRID_USERNAME'],
  #         :password       => ENV['SENDGRID_PASSWORD'],
  #         :domain         => 'heroku.com',
  #         :enable_starttls_auto => true
  # } 

  # Pony.options = {
  #   :via => :smtp, 
  #   :via_options => {
  #     :address        => 'smtp.sendgrid.net',
  #     :port           => '587',
  #     :enable_starttls_auto => true,
  #     :user_name      => ENV['SENDGRID_USERNAME'],
  #     :password       => ENV['SENDGRID_PASSWORD'],
  #     :authentication => :plain,
  #     :domain         => 'heroku.com'
  #   }
  # }

  # By default, Sinatra assumes that the root is the file that calls the configure block.
  # Since this is not the case for us, we set it manually.
  set :root, APP_ROOT.to_path
  # See: http://www.sinatrarb.com/faq.html#sessions
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  # Set the views to
  set :views, File.join(Sinatra::Application.root, "app", "views")

  register do
    def auth(type)
      condition do
        redirect ('/') unless send("current_#{type}")
      end
    end
  end

end


# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')

