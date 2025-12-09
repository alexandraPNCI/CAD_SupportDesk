require_relative "boot"

require "rails/all"
require "tzinfo/data"

Bundler.require(*Rails.groups)

module SupportDesk
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Disable Solid Cache / Queue / Cable databases (Rails 8 feature)
    config.active_record.databases = {
      production: {
        primary: {}
      }
    }

    # For Propshaft (Rails 7+ default asset pipeline)
    config.assets.paths << Rails.root.join("app", "assets", "stylesheets")
    
    # Ensure assets are enabled
    config.assets.enabled = true
    
    # Precompile configuration (may not be needed in development)
    config.assets.precompile += %w(application.css) if config.assets.enabled
    
    # Additional configuration...
  end
end


