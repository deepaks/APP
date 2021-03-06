# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')
 
Rails::Initializer.run do |config|
  config.load_paths += %W(#{RAILS_ROOT}/lib/middleware)
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"
  

  config.gem "authlogic"
	#config.gem "rspec", :version => '1.2.8', :lib => 'spec'
	config.gem "rspec-rails", :version => '1.2.7.1', :lib => false
  config.gem "ryanb-acts-as-list", :lib => "acts_as_list", :source => "http://gems.github.com"
  config.gem "geokit"
  config.gem "httparty"
	#config.gem "digitalpardoe-rflickr", :lib => "flickr", :source => "http://gems.github.com"
	config.gem "activemerchant", :lib => "active_merchant"
	#config.gem "ClothRed"
	config.gem "prawn"
	#config.gem 'disguise'
  #config.gem "matthooks-vimeo", :lib => "vimeo"
  

  #config.gem 'oauth', :version => '0.3.4'
  #config.gem 'twitter'
  #config.gem "google-geocode"
  #config.gem "geokit-rails"
  

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
  
  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with "rake db:sessions:create")
  config.action_controller.session_store = :active_record_store
  
  
end

# Email settings
ActionMailer::Base.delivery_method = :sendmail
ActionMailer::Base.sendmail_settings = {
:location => '/usr/sbin/sendmail',
:arguments => '-i -t'
}

#GeoKit Settings
GeoKit::Geocoders::google 
