ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rg"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
end
