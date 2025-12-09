require_relative "boot"

require "rails/all"
Bundler.require(*Rails.groups)

module SupportDesk
  class Application < Rails::Application
    config.load_defaults 8.1

    # Put your normal config overrides below this line.
  end
end