require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "openweather2"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OpenTranslation
  class Application < Rails::Application

    config.generators do |g|
      g.view_specs false
      g.helper_specs false
      g.controller_specs false
      g.helper false
      g.assets false
      g.routes false
    end

    Openweather2.configure do |config|
      puts "Configuring openweather"
      config.endpoint = 'http://api.openweathermap.org/data/2.5/weather'
      config.apikey = "bf678a15c92dc62ce8c25820512dd082"
    end

    config.i18n.default_locale = 'en'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
