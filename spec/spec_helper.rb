$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ingram_micro'
require 'support/factory_girl'
require 'faker'
require 'support/fabrication'
require 'support/matchers'
require 'active_support/core_ext/hash'

RSpec.configure do |rconfig|
  rconfig.before(:each) do
    IngramMicro.configure do |config|
      config.api_root = 'http://someroute.com'
      config.partner_name = 'Your company'
      config.partner_password = ''
      config.customer_id = '123'
      config.debug = false
      config.proxy = nil
    end

    IngramMicro.configuration.assert_valid
  end
end
