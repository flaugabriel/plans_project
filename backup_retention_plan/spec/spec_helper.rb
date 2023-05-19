# frozen_string_literal: true

require "backup_retention_plan"
require "byebug"

if ENV["RAILS_ENV"] == "test"
  require "simplecov"
  SimpleCov.start "rails"
  puts "required simplecov"
end

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
