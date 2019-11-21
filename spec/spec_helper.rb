require "bundler/setup"
require "malue"
require "vcr"
require "webmock"

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "fixtures"
  config.hook_into :webmock
end
