require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Arty
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.time_zone = 'Asia/Tokyo'
    config.i18n.default_locale = :ja
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # config.to_prepare do
    #   Devise::SessionsController.layout proc{ |controller| user_signed_in? ? "application" : "devise" }
    #   Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "devise" }
    #   Devise::ConfirmationsController.layout "devise"
    #   Devise::UnlocksController.layout "devise"
    #   Devise::PasswordsController.layout "devise"
    # end
  end
end
