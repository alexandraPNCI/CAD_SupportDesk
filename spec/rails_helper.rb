# spec/rails_helper.rb
require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "rspec/rails"
require "pundit/rspec"   # ← add this


# -------------------------
# Disable all test fixture support
# -------------------------
RSpec.configure do |config|
  # DO NOT use fixtures in RSpec at all:
  config.use_active_record = false
  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
