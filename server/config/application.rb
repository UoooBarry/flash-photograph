require_relative 'boot'
require_relative '../lib/middlewares/request_map_device'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Server
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.eager_load_paths << Rails.root.join('lib/middlewares')
    config.eager_load_paths << Rails.root.join('lib/services')
    config.middleware.use ::RequestMapDevice

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
